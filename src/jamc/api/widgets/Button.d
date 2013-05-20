module jamc.api.widgets.Button;

import jamc.api.widgets.AbstractButton;
import jamc.api.widgets.BaseWidget;
import jamc.api.widgets.IWidget;
import jamc.api.widgets.Label;
import jamc.util.vector;
import jamc.util.color;

class Button : AbstractButton
{
    this( IWidget parent, in vec2i pos, in vec2i size )
    {
        super( parent, pos, size );
        
        new Label( this, vec2i(0,0), size, "BUTON!" );
        
        connect( ( ButtonStateChangedEvent e ) {
            m_renderer.redraw();
        } );
    }
    
    override void draw( IRenderProxy r )
    {
        float mult = m_active ? 1.3f : 1.0f;
        mult *= m_pressed ? 0.75f : 1.0f;

        r.drawVerticalGradient(
            1, 1, size[0] - 2, size[1] - 2, 
            rgba( 1.0, 1.0, 1.0, 0.8 ) * mult, 
            rgba( 0.5, 0.5, 0.5, 0.8 ) * mult
        );
        
        if( !m_pressed ){
            r.setDrawColor( rgba( 1.0, 1.0, 1.0, 0.1 ) );
            r.drawQuad( 1, 1, size[0], size[1] / 2);
        }
    
        r.setDrawColor( rgba( 1.0, 1.0, 1.0, 0.9 ) );
        r.drawFrame( 0, 0, size[0], size[1] );
    }
}
