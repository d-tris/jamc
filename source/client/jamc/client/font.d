module jamc.client.font;

import std.stdio;

import dftgl.ftgl;
import std.exception;
import std.string;
import std.typecons;

import jamc.api.font;
import jamc.util.gpu.gl;
import jamc.util.vector;

class ClientFontMgr : IFontMgr
{
    override IFont getFont( string name, uint size )
    {
        auto fontPtr = tuple( name, size ) in fonts;
        if( fontPtr is null )
        {
            auto font = new FontFTGL( "resources/fonts/" ~ name ~ ".ttf", size );
            fonts[ tuple( name, size ) ] = font;
            return font;
        }
        else
        {
            return *fontPtr;
        }
    }
    
    private:
    
    IFont[ Tuple!( string, uint ) ] fonts;
}

class FontFTGL : IFont
{
    this( string filename, uint size )
    {
        _font = ftglCreateTextureFont( filename.toStringz() );
        
        if( _font is null )
        {
            throw new Exception( "Cannot load font" );
        }

        if( !ftglSetFontFaceSize( _font, size, 0 ) )
        {
            throw new Exception( "Cannot set font size" );
        }
    }
    
    ~this()
    {
        ftglDestroyFont( _font );
    }
    
    override uint getSize()
    {
        return ftglGetFontFaceSize( _font );
    }
    
    override void render( string text, in vec2i pos )
    {		
        glCall!glDisableClientState( GL_VERTEX_ARRAY );
        glCall!glDisableClientState( GL_COLOR_ARRAY );
        glCall!glDisableClientState( GL_TEXTURE_COORD_ARRAY );
        
        glCall!glPushBuffer( GL_ARRAY_BUFFER, 0 );
        glCall!glPushBuffer( GL_ELEMENT_ARRAY_BUFFER, 0 );
        glCall!glPushMatrix();
        glCall!glTranslated( pos[0], getSize() + pos[1], 0. );
        glCall!glScaled( 1.0, -1.0, 1.0 );
        glCall!glColor4f( 1.0, 1.0, 1.0, 1.0 );
        enforce(glCall!glGetError() == GL_NO_ERROR, "glCall!glGetError() before FTGL" );
        ftglRenderFont( _font, text.toStringz(), FTGL_RENDER_ALL );
        enforce( !glCall!glGetError(), "glCall!glGetError() after FTGL" );
        glCall!glPopMatrix();
        glCall!glPopBuffer( GL_ARRAY_BUFFER );
        glCall!glPopBuffer( GL_ELEMENT_ARRAY_BUFFER );
        
        glCall!glEnableClientState( GL_VERTEX_ARRAY );
        glCall!glEnableClientState( GL_TEXTURE_COORD_ARRAY );
        glCall!glEnableClientState( GL_COLOR_ARRAY );
        
        enforce( !glCall!glGetError(), "glCall!glGetError()" );
    }
    
    private:
    
    FTGLfont* _font;
}
