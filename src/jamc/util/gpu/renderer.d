module jamc.util.gpu.renderer;

import std.algorithm;
import std.array;
import std.container;

import jamc.util.gpu.buffer;

class Renderer( RenderFormat )
{
public:

    alias vertex_type      = RenderFormat.vertex_type;
    alias index_type       = RenderFormat.index_type;
    alias index_index_type = RenderFormat.index_index_type;
    alias vertex_format    = RenderFormat.vertex_format;
    alias index_format     = RenderFormat.index_format;
    alias material_type    = RenderFormat.material_type;

    this( RenderFormat format,
          IGpuAllocator!vertex_format vertexAllocator, 
          IGpuAllocator!index_format indexAllocator, 
          IRenderable renderable )
    {
        m_format = format;
        m_vertexAllocator = vertexAllocator;
        m_indexAllocator = indexAllocator;
        m_renderable = renderable;
        
        m_valid = false;
        m_vertexBlock = vertexAllocator.nullBlock;
        m_indexBlock = indexAllocator.nullBlock;
    }
    
    void invalidate()
    {
        m_valid = false;
    }
    
    void draw()
    {
        if( !m_valid )
        {
            m_indexCount = 0;
            m_parts.clear();
            
            m_parts ~= Part( m_format.getDefaultMaterial(), 0 ); // todo: nahradit null materiál něčím rozumným

            m_renderable.draw();
            upload();
            m_valid = true;
            m_empty = empty();
            m_vertexCount = cast(index_type) m_vertices.length;
            m_parts.back.indexCount = cast(index_type)( m_indices.length - m_indexCount );
            m_vertices.clear();
            m_indices.clear();
        }

        if( !m_empty )
        {
            foreach( part; m_parts )
            {
                m_format.bindMaterial( part.material );
                m_format.draw( cast(index_type)( m_indexBlock + part.indexBlockOffset ), part.indexCount, m_baseVertex, m_vertexCount );
            }
        }
    }

    void pushVertex( vertex_type vertex )
    {
        m_vertices ~= vertex;
    }
    
    void pushIndex( index_type index )
    {
        m_indices ~= index;
    }
    
    void pushIndex3( index_type i1, index_type i2, index_type i3 )
    {
        m_indices ~= i1;
        m_indices ~= i2;
        m_indices ~= i3;
    }

    static if( __traits( compiles, cast(index_type)int.init ) )
    {
        void pushIndex( int index )
        {
            m_indices ~= cast(index_type) index;
        }
        
        void pushIndex3( int i1, int i2, int i3 )
        {
            m_indices ~= cast(index_type) i1;
            m_indices ~= cast(index_type) i2;
            m_indices ~= cast(index_type) i3;
        }
    }

    void setMaterial( material_type mat )
    {
        m_parts.back.indexCount = cast(index_index_type)( m_indices.length - m_indexCount );

        if( m_parts.back.indexCount == 0 )
        {
            m_parts.removeBack();
        }

        m_indexCount = cast(index_index_type) m_indices.length;
        m_parts.insertBack( Part( mat, cast(index_index_type) m_indices.length ) );
    }

    @property index_type vertexCount() const
    {
        return cast(index_type) m_vertices.length;
    }

    @property IGpuAllocator!vertex_format vertexAllocator()
    {
        return m_vertexAllocator;
    }
    
    @property IGpuAllocator!index_format indexAllocator()
    {
        return m_indexAllocator;
    }

    bool empty()
    {
        assert( m_vertices.empty() == m_indices.empty() );
        return m_vertices.empty();
    }

private:
    void upload()
    {
        if( empty() ) return;
        m_vertexBlock = m_vertexAllocator.upload( m_vertices, m_vertexBlock );
        m_baseVertex = m_vertexBlock;
        m_indices = array( map!( i => cast(index_type)( i + m_baseVertex ) )( m_indices ) );
        m_indexBlock = m_indexAllocator.upload( m_indices, m_indexBlock );
    }
    
    bool m_valid;
    bool m_empty;

    static struct Part
    {
        this( material_type material, index_index_type indexBlockOffset )
        {
            this.material = material;
            this.indexBlockOffset = indexBlockOffset;
            this.indexCount = 0;
        }
        
        material_type material;
        index_index_type indexBlockOffset;
        index_index_type indexCount;
    };

    RenderFormat m_format;
    IRenderable m_renderable;

    index_type          m_vertexCount;
    index_index_type    m_indexCount;

    index_type          m_baseVertex;
    index_type          m_vertexBlock;
    index_index_type    m_indexBlock;

    IGpuAllocator!vertex_format m_vertexAllocator;
    IGpuAllocator!index_format m_indexAllocator;
    vertex_type[] m_vertices;
    index_type[] m_indices;

    Array!Part m_parts;
    index_type m_lastPartVertexCount;
    index_index_type m_lastPartIndexCount;
}

