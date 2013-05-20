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
        glDisableClientState( GL_VERTEX_ARRAY );
        glDisableClientState( GL_COLOR_ARRAY );
        glDisableClientState( GL_TEXTURE_COORD_ARRAY );
        
        glPushBuffer( GL_ARRAY_BUFFER, 0 );
        glPushBuffer( GL_ELEMENT_ARRAY_BUFFER, 0 );
        glPushMatrix();
        glTranslated( pos[0], getSize() + pos[1], 0. );
        glScaled( 1.0, -1.0, 1.0 );
        glColor4f( 1.0, 1.0, 1.0, 1.0 );
        ftglRenderFont( _font, text.toStringz(), FTGL_RENDER_ALL );
        enforce( !glGetError(), "glGetError()" );
        glPopMatrix();
        glPopBuffer( GL_ARRAY_BUFFER );
        glPopBuffer( GL_ELEMENT_ARRAY_BUFFER );
        
        glEnableClientState( GL_VERTEX_ARRAY );
        glEnableClientState( GL_TEXTURE_COORD_ARRAY );
        glEnableClientState( GL_COLOR_ARRAY );
        
        enforce( !glGetError(), "glGetError()" );
    }
    
    private:
    
    FTGLfont* _font;
}
