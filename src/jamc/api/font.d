module jamc.api.font;

import jamc.util.vector;

interface IFontMgr
{
    IFont getFont( string name, uint size );
}

interface IFont
{
    uint getSize();
    void render( string text, in vec2i );
}

