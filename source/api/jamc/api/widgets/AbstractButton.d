module jamc.api.widgets.AbstractButton;

import jamc.api.eventTypes;
import jamc.api.widgets.BaseWidget;
import jamc.api.widgets.IWidget;
import jamc.util.vector;

import jamc.api.events;

class AbstractButton : BaseWidget
{
    public:
        
    this( IWidget parent, in vec2i pos, in vec2i size )
    {
        super( parent, pos, size );
        
        connect( ( MouseDownEvent e ){ 
            if( e.button == Key.MouseLeft )
            {
                m_pressed = true;
                raise( new ButtonStateChangedEvent() );
            }
        } );
        
        connect( ( MouseUpEvent e ){
            if( e.button == Key.MouseLeft )
            {
                m_pressed = false;
                raise( new ButtonStateChangedEvent() );
            }
        } );
        
        connect( ( MouseOverEvent e ){
            m_active = true;
            raise( new ButtonStateChangedEvent() );
        } );
        
        connect( ( MouseOutEvent e ){
            m_active = false;
            m_pressed = false;
            raise( new ButtonStateChangedEvent() );
        } );
    }
    
    protected:
    
    bool m_active;
    bool m_pressed;
}

class ButtonStateChangedEvent : IEvent
{}
