module jamc.util.gpu.ibuffer;

interface IGpuAllocator( BufferFormat )
{
    alias value_type = BufferFormat.value_type;
    alias size_type = BufferFormat.size_type;
    alias format = BufferFormat;
    
    size_type upload( value_type[] data, size_type block );
    enum nullBlock = ~cast(size_type)0;
}
