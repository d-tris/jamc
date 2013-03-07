module jamc.api.widgets.BaseWidget;

import jamc.api.events;
import jamc.api.game;
import jamc.api.material;
import jamc.api.renderer;
import jamc.api.widgets.IWidget;

import jamc.util.color;
import jamc.util.vector;

import std.algorithm;
import std.container;
import std.datetime;
import std.stdio;

public import CSFML.Window.Mouse : sfMouseButton;

interface IRenderProxy
{
    void setMaterial( IMaterial material );
    void setDrawColor( in rgba color );
    rgba getDrawColor();

    void drawQuad( int x, int y, int w, int h );
    void drawVerticalGradient( int x, int y, int w, int h, in rgba colOne, in rgba colTwo );
    void drawHorizontalGradient( int x, int y, int w, int h, in rgba colOne, in rgba colTwo );
    void drawFrame( int x, int y, int w, int h );

    void redraw();

    void setAlpha( double alpha );

    void enterElement( int depth );
    void prepareStencilAddition( int depth );
    void prepareStencilSubtraction( int depth );

    void translate( int x, int y );
    void pushTransform();
    void popTransform();

    void render();
    
    interface IRenderable
    {
        void draw( IRenderProxy r );
    }
}

class StencilRenderable : IRenderProxy.IRenderable
{
    public:
        this( IWidget parent )
        {
            m_parent = parent;
        }
        
        void draw( IRenderProxy r )
        {
            r.drawQuad( 0, 0, m_parent.size[0], m_parent.size[1] );
        }
        
    private:
        IWidget m_parent;
}

class BaseWidget : EventSource, IWidget, IRenderProxy.IRenderable
{
public:
    this( IGame game, vec2i pos, vec2i size )
    {
        super( game.events );
        
        m_game = game;
        m_position = pos;
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
    
    override void draw( IRenderProxy r )
    {
        // BaseWidget se nijak nevykresluje
        //m_renderer.redraw();
        r.drawHorizontalGradient( 0, 0, size[0], size[1], rgba( 1.0f, 0.0f, 0.0f, 1.0f ), rgba( 0.0f, 1.0f, 0.0f, 0.0f ) ); 
    }
    
    override void doDraw( int depth )
    {
        m_renderer.enterElement( depth );
        drawImpl();

        m_renderer.prepareStencilAddition( depth );
        m_stencilRenderer.render();

        foreach( child; m_children )
        {
            if( child.visible ){
                m_renderer.pushTransform();
                m_renderer.translate( child.position[0], child.position[1] );
                writeln( "Posunuju dítě na ", child.position );
                child.doDraw( depth + 1 );
                m_renderer.popTransform();
            }
        }

        m_renderer.prepareStencilSubtraction( depth );
        m_stencilRenderer.render();
    }
    
    override @property void position( vec2i position )
    {
        if( m_position != position )
        {
            m_stencilRenderer.redraw();
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

    /** 
     * Implementuje konkrétní způsob vykreslení pouze tohoto elementu 
     * přímo na obrazovku.
     */
    void drawImpl()
    {
        m_renderer.render();
    }

    IRenderProxy m_renderer;
    IRenderProxy m_stencilRenderer;

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
