module jamc.client.gui;

import jamc.api.renderer;
import jamc.util.gpu.buffer;
import jamc.util.gpu.renderer;

class GuiRenderFormat
{
    static struct vertex_type
    {
        version( GuiRenderFormat_UsePackedFormat )
        {
            this( GLshort x, GLshort y, rgba color, GLfloat s, GLfloat t )
            {
                this.x = x;
                this.y = y;
                color.normalize();
                r = cast(GLubyte)( color[0] * 255.0 );
                g = cast(GLubyte)( color[1] * 255.0 );
                b = cast(GLubyte)( color[2] * 255.0 );
                a = cast(GLubyte)( color[3] * 255.0 );
                this.s = s;
                this.t = t;
            }
            GLshort x, y;
            GLubyte r, g, b, a;
            GLfloat s, t;
        }
        else
        {
            this( GLint x, GLint y, rgba color, GLfloat s, GLfloat t )
            {
                this.x = x;
                this.y = y;
                this.s = s;
                this.t = t;
                r = color[0];
                g = color[1];
                b = color[2];
                a = color[3];
            }
            GLint x, y;
            GLfloat s, t;
            GLfloat r, g, b, a;
        }
    }
    alias index_type = GLushort;
    alias index_index_type = GLushort;
    
    alias material_type = IMaterial;

    static struct vertex_format
    {
        alias value_type = vertex_type;
        alias size_type = index_type;
    }
    
    static struct index_format
    {
        alias value_type = index_type;
        alias size_type = index_index_type;
    }

    void begin()
    {
        glEnableClientState( GL_VERTEX_ARRAY );
        glEnableClientState( GL_TEXTURE_COORD_ARRAY );
        glEnableClientState( GL_COLOR_ARRAY );

        glEnable( GL_STENCIL_TEST );
        glEnable( GL_TEXTURE_2D );

        version( GuiRenderFormat_UsePackedFormat )
        {
            glVertexPointer( 2, GL_SHORT, vertex_type.sizeof, glToOffset( 0 ) );
            glColorPointer( 4, GL_UNSIGNED_BYTE, vertex_type.sizeof, glToOffset( 2*sizeof( GLshort ) ) );
            glTexCoordPointer( 2, GL_FLOAT, vertex_type.sizeof, glToOffset( 2*sizeof( GLshort ) + 4*sizeof( GLubyte ) ) );
        }
        else
        {
            glVertexPointer( 2, GL_INT, vertex_type.sizeof, glToOffset( 0 ) );
            glTexCoordPointer( 2, GL_FLOAT, vertex_type.sizeof, glToOffset( 2*GLint.sizeof ) );
            glColorPointer( 4, GL_FLOAT, vertex_type.sizeof, glToOffset( 2*GLint.sizeof + 2*GLfloat.sizeof ) );
        }
    }
    
    void end()
    {
        glDisableClientState( GL_VERTEX_ARRAY );
        glDisableClientState( GL_COLOR_ARRAY );
        glDisableClientState( GL_TEXTURE_COORD_ARRAY );

        glColorMask( GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE );
        glStencilOp( GL_KEEP, GL_KEEP, GL_KEEP );
        glDisable( GL_STENCIL_TEST );
    }
    
    void draw( index_index_type indexStart, index_index_type indexCount, index_type vertexStart, index_type vertexCount )
    {
        glDrawRangeElements( GL_TRIANGLES, vertexStart, vertexStart + vertexCount - 1 , 
                             indexCount, GL_UNSIGNED_SHORT, glToOffset( indexStart * index_type.sizeof ) );
    }
    
    material_type getDefaultMaterial()
    {
        return new Material(); // opět dočasné
    }
    
    void bindMaterial( material_type mat )
    {
        // opět dočasné
    }
}

class RenderProxy
{
public:
    this( GuiRenderFormat renderFormat,
          IGpuAllocator!( GuiRenderFormat.vertex_format ) vertexManager,
          IGpuAllocator!( GuiRenderFormat.index_format ) indexManager,
          IRenderable renderable )
    {
        m_renderer = new Renderer!( GuiRenderFormat )( renderFormat, vertexManager, indexManager, renderable );
        m_alpha = 1.0;
        m_drawColor = rgba( 1.0, 1.0, 1.0, 0.1 );
    }

    void setMaterial( IMaterial material )
    {
        m_renderer.setMaterial( material );
    }

    void setDrawColor( in rgba color )
    {
        m_drawColor = color;
        m_drawColor[3] = min( max( m_alpha * color[3], 0.0 ), 1.0 );
    }

    rgba getDrawColor()
    {
        return m_drawColor;
    }

    void drawQuad( int x, int y, int w, int h )
    {
        auto vc = m_renderer.vertexCount;
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x, y, m_drawColor, 0.0f, 1.0f ) );
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x, y + h, m_drawColor, 0.0f, 0.0f ) );
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x + w, y + h, m_drawColor, 1.0f, 0.0f ) );
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x + w, y, m_drawColor, 1.0f, 1.0f ) );
        m_renderer.pushIndex3( vc, vc + 1, vc + 3 );
        m_renderer.pushIndex3( vc + 1, vc + 2, vc + 3 );
    }

    void drawVerticalGradient( int x, int y, int w, int h, in rgba colOne, in rgba colTwo )
    {
        auto vc = m_renderer.vertexCount;
        setDrawColor( colOne );
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x + w, y, m_drawColor, 1.0f, 1.0f ) );
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x, y, m_drawColor, 0.0f, 1.0f ) );
        setDrawColor( colTwo );
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x, y + h, m_drawColor, 0.0f, 0.0f ) );
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x + w, y+h, m_drawColor, 1.0f, 0.0f ) );
        m_renderer.pushIndex3( vc, vc + 1, vc + 3 );
        m_renderer.pushIndex3( vc + 1, vc + 2, vc + 3 );
    }

    void drawHorizontalGradient( int x, int y, int w, int h, in rgba colOne, in rgba colTwo )
    {
        auto vc = m_renderer.vertexCount;
        setDrawColor( colOne );
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x, y, m_drawColor, 0.0f, 1.0f ) );
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x, y + h, m_drawColor, 0.0f, 0.0f ) );
        setDrawColor( colTwo );
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x + w, y + h, m_drawColor, 1.0f, 0.0f ) );
        m_renderer.pushVertex( GuiRenderFormat.vertex_type( x + w, y, m_drawColor, 1.0f, 0.0f ) );
        m_renderer.pushIndex3( vc, vc + 1, vc + 3 );
        m_renderer.pushIndex3( vc + 1, vc + 2, vc + 3);
    }

    void drawFrame( int x, int y, int w, int h )
    {
        drawQuad(x,     y+1,   1,   h-2);
        drawQuad(x+1,   y,     w-2, 1);
        drawQuad(x+w-1, y+1,   1,   h-2);
        drawQuad(x+1,   y+h-1, w-2, 1);
    }

    void redraw()
    {
        m_renderer.invalidate();
    }

    void setAlpha( double alpha )
    {
        m_alpha = alpha;
    }

    @property IGpuAllocator!( GuiRenderFormat.vertex_format ) vertexAllocator()
    {
        return m_renderer.vertexAllocator;
    }

    @property IGpuAllocator!( GuiRenderFormat.index_format ) indexAllocator()
    {
        return m_renderer.indexAllocator;
    }

    void draw()
    {
        m_renderer.draw();
    }

private:
    Renderer!( GuiRenderFormat ) m_renderer;
    double m_alpha;
    rgba m_drawColor;
}
