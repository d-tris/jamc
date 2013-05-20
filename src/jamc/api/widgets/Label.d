module jamc.api.widgets.Label;

import jamc.api.font;
import jamc.api.widgets.BaseWidget;
import jamc.util.vector;

class Label : BaseWidget
{
    public:
    
    this( IWidget parent, in vec2i pos, in vec2i size, string text = "" )
    {
        super( parent, pos, size );
        
        _text = text;
        _font = m_game.fonts.getFont( "arialuni", size[0] );
    }
    
    protected:
    
    override void drawImpl()
    {
        _font.render( _text, vec2i( 0, 0 ) );
    }
    
    IFont _font;
    string _text;
}
