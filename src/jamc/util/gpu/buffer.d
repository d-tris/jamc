module jamc.util.gpu.buffer;

import std.algorithm;
import std.container;

class BufferObjectManager( BufferFormat )
{
    alias value_type = BufferFormat.value_type;
    alias size_type = BufferFormat.size_type;
    alias format = BufferFormat;

    this( GLenum target, GLenum usage )
    {
        m_target = target;
        m_usage = usage;
    }
    
    ~this()
    {
        clear();
    }

    void allocate( size_type size )
    {
        clear();
        glGenBuffers( 1, &m_buffer );
        glPushBuffer( m_target, m_buffer );
        glBufferData( m_target, size * value_type.sizeof, null, m_usage );
        glPopBuffer( m_target );
        m_capacity = m_size;
    }
    
    void resize( size_type newSize )
    {
        GLuint oldBuffer = m_buffer;
        glPushBuffer( m_target, oldBuffer );

        auto oldData = glMapBuffer( m_target, GL_READ_ONLY );

        glGenBuffers( 1, &m_buffer );
        glPushBuffer( m_target, m_buffer );
        // tady bude asi nutne pouzit kombinaci glBufferData pro vytvoreni
        // prostoru a glBufferSubData pro nakopirovani dat
        glBufferData( m_target, ( newSize, m_capacity ) * value_type.sizeof, oldData, m_usage );
        m_capacity = newSize;
        glPopBuffer( m_target );
        glPopBuffer( m_target );

        deleteBuffers( 1, &oldBuffer );
    }
    
    void upload( value_type[] data, size_type start )
    {
        glPushBuffer( m_target, m_buffer );
        glBufferSubData( m_target, start * value_type.sizeof, data.size() * value_type.sizeof, data.ptr );
        glPopBuffer( m_target );
    }
    
    void clear()
    {
        if( m_buffer != 0 )
            deleteBuffers( 1, &m_buffer );
    }
    
    @property size_type capacity()
    {
        return m_capacity;
    }

    void push()
    {
        glPushBuffer( m_target, m_buffer );
    }
    
    void pop()
    {
        glPopBuffer( m_target );
    }

private:
    GLuint m_buffer;
    size_type m_capacity;
    GLenum m_target;
    GLenum m_usage;
}

interface IGpuAllocator( BufferFormat )
{
    alias value_type = BufferFormat.value_type;
    alias size_type = BufferFormat.size_type;
    alias format = BufferFormat;
    
    size_type upload( value_type[] data, size_type block );
    enum nullBlock = ~cast(size_type)0;
}

class GpuAllocator( BufferManager ) : IGpuAllocator!( BufferManager.format )
{
    this( BufferManager manager, size_type initialCapacity )
    {
        m_manager = manager;
        m_freeBlocks = new BlockMap();
        m_usedBlocks = new BlockMap();
        
        m_manager.allocate( initialCapacity );
        m_freeBlocks.insert( Block( 0, initialCapacity ) );
    }
    
    size_type upload( value_type[] data, size_type blockStart )
    in
    {
        assert( data.length > 0 );
    }
    body
    {
        if( blockStart != nullBlock )
        {
            auto blockRng = m_usedBlocks.equalRange( Block( blockStart, 0 ) );
            if( blockRng.empty() ) throw new Exception( "GpuAllocator: Block address " ~ to!string( block ) ~ " not in use" );

            if( data.length > blockRng.front.length )
            {
                // starý blok je příliš malý, takže ho uvolníme a později získáme nový
                markAsFree( blockRng );
                block = nullBlock;
            }
            else if( data.length <= blockRng.front.length/2 ) 
            {
                // zmenšíme jenom, když to stojí za to
                shrink( blockRng, data.length );
            }
        }

        // potřebujeme alokovat nový blok?
        if( block == nullBlock )
        {
            auto newBlock = findFreeBlock( data.length );
            if( newBlock.empty )
            {
                // potřebujeme změnit velikost celého bufferu
                resize( m_manager.getCapacity() * 2 );
                newBlock = findFreeBlock( data.length );
                assert( !newBlock.empty );
            }
            block = newBlock.start;
            markAsUsed( newBlock, data.length );
        }

        // a konečně nahrajeme data
        m_manager.upload( data, block );
        return block;
    }

    struct Block
    {
        size_type start;
        size_type length;
        @property size_type end()
        {
            return start + length;
        }
    }

private:

    alias BlockMap = RedBlackTree!( Block, "a.start < b.start" );
    
    
    BlockMap.Range getSpaceAfter( Block block )
    {
        return m_freeBlocks.equalRange( Block( block.end ) );
    }
    
    BlockMap.Range getSpaceBefore( Block block )
    {
        auto rng = m_freeBlocks.lowerBound( block );
        if( rng.empty || rng.back.end != block.start ) return BlockMap.Range();
        else return m_freeBlocks.equalRange( Block( rng.back.start ) );
    }

    void shrink( BlockMap.Range block, size_type newSize )
    in
    {
        assert( newSize < block.front.length );
    }
    body
    {
        auto spaceAfter = getSpaceAfter( block.front );
        auto diff = block.front.length - newSize;
        
        if( !spaceAfter.empty )
        {
            block.front.length = newSize;
            auto freeBlock = spaceAfter.front;
            freeBlock.start -= diff;
            freeBlock.legth += diff;
            m_freeBlocks.remove( spaceAfter );
            m_freeBlocks.insert( freeBlock );
        }
        else
        {
            block.front.length = newSize;
            m_freeBlocks.insert( Block( block.front.end, diff ) );
        }
    }
    
    BlockMap.Range findFreeBlock( size_type length )
    {
        for( auto r = m_freeBlocks[]; !r.empty; r.popBack() )
        {
            if( r.back.length <= length )
            {
                return m_freeBlocks.equalRange( r.back.start );
            }
        }
    }


    // block musí ukazovat pouze na jeden prvek
    void markAsFree( BlockMap.Range block )
    in
    {
        auto blockDup = block.save();
        blockDup.popFront();
        assert( blockDup.empty );
    }
    body
    {
        auto spaceBefore = getSpaceBefore( block.front );
        auto spaceAfter = getSpaceAfter( block.front );

        if( !spaceBefore.empty && !spaceAfter.empty )
        {
            // zvětšíme předchozí prázdný blok
            spaceBefore.first.length += block.front.length + spaceAfter.length;
            
            // smažeme následující prázdný blok
            m_freeBlocks.remove( spaceAfter );
        }
        else if( spaceBefore.empty && !spaceAfter.empty )
        {
            // přesuneme volný blok a zvětšíme ho
            auto newFreeBlock = spaceAfter.front;
            newFreeBlock.length += block.front.length;
            newFreeBlock.start = block.front.start;
            m_freeBlocks.remove( spaceAfter );
            m_freeBlocks.insert( newFreeBlock );
        }
        else if( !spaceBefore.empty && spaceAfter.empty )
        {
            // zvětšíme volný blok
            spaceBefore.front.length += block.front.length;
        }
        else
        {
            m_freeBlocks.insert( block.front );
        }

        m_usedBlocks.remove( block );
    }
    
    void markAsUsed( BlockMap.Range block, size_type length )
    in
    {
        auto blockDup = block.save();
        blockDup.popFront();
        assert( blockDup.empty );
    }
    body
    {
        m_usedBlocks.insert( Block( block.front.start, length ) );
        auto newFreeBlock = block.front;
        newFreeBlock.length -= length;
        newFreeBlock.start += length;
        m_freeBlocks.remove( block );
        m_freeBlocks.insert( newFreeBlock );
    }

    void resize( size_type newCapacity )
    {
        if( newCapacity < m_manager.capacity ) throw new Exception( "Shrinking a gpu buffer not yet imlemented." );
        
        auto allFreeBlocks = m_freeBlocks[];
        if( allFreeBlocks.back.start + allFreeBlocks.back.length != m_manager.capacity )
        {
            // před koncem bufferu je použitý blok, takže za něj vložíme
            // nový, prázdný
            m_freeBlocks.insert( Block( m_manager.capacity, newCapacity - m_manager.capacity ) );
        }
        else
        {
            allFreeBlocks.back.length += newCapacity - m_manager.capacity;
        }

        m_manager.resize( newCapacity );
    }

    BlockMap m_freeBlocks;
    BlockMap m_usedBlocks;

    BufferManager m_manager;
}

