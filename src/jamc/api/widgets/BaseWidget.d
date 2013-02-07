module jamc.api.widgets.BaseWidget;

import jamc.api.events;
import jamc.api.game;
import jamc.api.material;
import jamc.api.widgets.IWidget;

import jamc.util.gpu.buffer;
import jamc.util.gpu.gl;
import jamc.util.gpu.renderer;
import jamc.util.color;
import jamc.util.vector;

import std.algorithm;
import std.container;
import std.datetime;

import CSFML.Window.Mouse;

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

class StencilRenderable : IRenderable
{
    public:
        this( IWidget parent )
        {
            m_parent = parent;
        }
        
        void draw()
        {
            m_renderer.drawQuad( 0, 0, m_parent.size[0], m_parent.size[1] );
        }
        
        @property RenderProxy proxy()
        {
            return m_renderer;
        }
        
        @property void proxy( RenderProxy proxy )
        {
            m_renderer = proxy;
        }
        
    private:
        IWidget m_parent;
        RenderProxy m_renderer;
}

class BaseWidget : IWidget, IRenderable
{
public:
    this( IGame game, vec2i pos, vec2i size )
    {
        m_game = game;
        m_position = position;
        m_size = size;
        
        m_opacity = 1.;
        m_visible = true;
        m_mouseOver = false;
        m_allowMouseClickPropagation = true;
        m_allowKeyboardInput = false;

        m_alphaStart = 1.0;
        m_alphaEnd = 1.0;
        m_time = seconds(1);
        m_hideAfterFade = false;
        
        m_renderer = m_game.gui.getNewRenderProxy( this );
        m_stencilRenderable = new StencilRenderable( this );
        m_stencilRenderer = m_game.gui.getNewRenderProxy( m_stencilRenderable );
    }
    
    this( IWidget parent, vec2i pos, vec2i size)
    {
        m_parent = parent;
        this( parent.game, pos, size );
        parent.addChild( this );
    }
    
    override void draw()
    {
        // BaseWidget se nijak nevykresluje
    }
    
    override void doDraw( int depth )
    {
        // TODO
    }
    
    override @property void position( vec2i position )
    {
        if( m_position != position )
        {
            PositionChangedEvent evt = new PositionChangedEvent( m_position, position );
            m_position = position;
            game.events.raise( evt );
        }
    }
    
    override @property vec2i position() const
    {
        return m_position;
    }
    
    override @property void size( vec2i size )
    {
        if( m_size != size )
        {
            SizeChangedEvent evt = new SizeChangedEvent( m_size, size );
            m_size = size;
            game.events.raise( evt );
        }
    }
    
    override @property vec2i size() const
    {
        return m_size;
    }
    
    override bool isPointInside( vec2i point )
    {
        return point[0] >= 0 && point[0] < m_size[0] && 
               point[1] >= 0 && point[1] < m_size[1];
    }
    
    override @property void visible( bool visible )
    {
        m_visible = visible;
    }

    override @property bool visible() const
    {
        return m_visible;
    }
    
    override bool isVisible() const
    {
        if( m_parent )
        {
            return m_visible && m_parent.isVisible();
        }
        else
        {
            return m_visible;
        }
    }
    
    override void opacity( float opacity )
    {
        m_opacity = opacity;
    }
    
    override float opacity() const
    {
        return m_opacity;
    }
    
    override void fadeTo( float targetOpacity, Duration dur, bool hideAfterFade = false )
    {
        // TODO, potřebujeme přístup k času
    }

    override @property IWidget parent()
    {
        return m_parent;
    }

    override void addChild( IWidget child )
    {
        m_children.insertFront( child );
    }
    
    override void removeChild( IWidget child )
    {
        auto rng = m_children[].find!("cast(void*)a == cast(void*)b")( child );
        assert( !rng.empty );
        m_children.remove( rng );
    }
    
    override void clearChildren()
    {
        m_children.clear();
    }
    
    override void giveFocusTo( IWidget child )
    {
        removeChild( child );
        m_children.insertFront( child );
    }

    override void handleDrag( vec2i delta, sfMouseButton mb )
    {
        m_game.events.raise( new DragEvent( delta, mb ), this );
    }
    
    override bool handleMouseClick( vec2i position, sfMouseButton mb, bool up )
    {
        foreach( child; m_children )
        {
            vec2i relativePosition = position - child.position;
            if( child.visible && child.isPointInside( relativePosition ) )
            {
                if( child.handleMouseClick( relativePosition, mb, up ) )
                {
                    break;
                }
                else
                {
                    // pokud nemáme reagovat na myš, tak končíme
                    return false;
                }
            }
        }

        bool wasDown = m_mouseDown[mb];
        m_mouseDown[mb] = !up;
        
        // tlačítko bylo právě puštěno
        if( wasDown && up ){
            game.events.raise( new ClickEvent( position, mb ), this );
        }
        
        if( up )
        {
            game.events.raise( new MouseUpEvent( position, mb ), this );
        }
        else
        {
            game.events.raise( new MouseDownEvent( position, mb ), this );
        }
        
        // měli bysme zde nějak aktivovat vstup z klávesnice?
        
        return m_allowMouseClickPropagation;
    }
    
    override void handleMouseMove( vec2i position, bool mouseOver )
    {
        bool childFound = false;
        
        foreach( child; m_children )
        {
            vec2i relativePosition = position - child.position;
            if( !childFound && child.visible && child.isPointInside( relativePosition ) )
            {
                child.handleMouseMove( relativePosition, true );
                childFound = true;
            }
            else
            {
                if( child.mouseOver )
                {
                    child.handleMouseMove( relativePosition, false );
                }
            }
        }

        if( m_mouseOver && !mouseOver )
        {
            game.events.raise( new MouseOutEvent(), this );
        }
        
        if( !m_mouseOver && mouseOver )
        {
            game.events.raise( new MouseOverEvent(), this );
        }

        m_mouseOver = mouseOver;

        game.events.raise( new MouseMoveEvent( position, mouseOver ), this );
    }
    
    override void handleWheel( vec2i position, int amount )
    {
        foreach( child; m_children )
        {
            vec2i relativePosition = position - child.position;
            if( child.visible && child.isPointInside( relativePosition ) )
            {
                child.handleWheel( relativePosition, amount );
                break;
            }
        }

        game.events.raise( new MouseWheelEvent( position, amount ), this );
    }
    
    override @property bool mouseOver()
    {
        return m_mouseOver;
    }
    
    override void handleKeyboard( string text )
    {}
    
    override @property bool allowKeyboardInput() const
    {
        return m_allowKeyboardInput;
    }
    
    override @property IGame game()
    {
        return m_game;
    }

protected:
    RenderProxy m_renderer;
    RenderProxy m_stencilRenderer;

    StencilRenderable m_stencilRenderable;

    DList!IWidget   m_children;
    IWidget         m_parent;
    
    vec2i           m_position;
    vec2i           m_size;
    bool            m_visible;
    float           m_opacity;  
    bool            m_allowMouseClickPropagation;
    bool            m_allowKeyboardInput;
    bool            m_mouseOver;
    bool[sfMouseButton.max] m_mouseDown;

    double          m_alphaStart;
    SysTime         m_timeStart;
    Duration        m_time;
    double          m_alphaEnd;
    double          m_calculatedOpacity;
    bool            m_hideAfterFade;

    IGame           m_game;
}

// GUI události
class DragEvent : IEvent
{
    this( in vec2i delta, in sfMouseButton button )
    {
        this.delta = delta;
        this.button = button;
    }
    vec2i delta;
    sfMouseButton button;
}

mixin template MouseButtonEvent()
{
    this( in vec2i position, in sfMouseButton button )
    {
        this.position = position;
        this.button = button;
    }
    vec2i position;
    sfMouseButton button;
}

class ClickEvent : IEvent
{
    mixin MouseButtonEvent;
}

class MouseDownEvent : IEvent
{
    mixin MouseButtonEvent;
}

class MouseUpEvent : IEvent
{
    mixin MouseButtonEvent;
}

class MouseOverEvent : IEvent
{}

class MouseOutEvent : IEvent
{}

class MouseMoveEvent : IEvent
{
    this( in vec2i position, in bool mouseOver )
    {
        this.position = position;
        this.mouseOver = mouseOver;
    }
    vec2i position;
    bool mouseOver;
}

class MouseWheelEvent : IEvent
{
    this( in vec2i position, in int amount )
    {
        this.position = position;
        this.amount = amount;
    }
    vec2i position;
    int amount;
}

class PositionChangedEvent : IEvent
{
    this( in vec2i oldPosition, in vec2i newPosition )
    {
        this.oldPosition = oldPosition;
        this.newPosition = newPosition;
    }
    vec2i oldPosition;
    vec2i newPosition;
}

class SizeChangedEvent : IEvent
{
    this( in vec2i oldSize, in vec2i newSize )
    {
        this.oldSize = oldSize;
        this.newSize = newSize;
    }
    vec2i oldSize;
    vec2i newSize;
}
