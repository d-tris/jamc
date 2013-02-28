module jamc.client.graphics;


import std.conv;
import std.exception;
import std.stdio;
import std.typetuple;

import GL.glu;

import jamc.api.eventTypes;
import jamc.api.game;
import jamc.api.graphics;
import jamc.util.vector;
import jamc.util.gpu.gl;
import CSFML.Graphics.All;
import CSFML.Window.All;
import CSFML.Config;

extern(C)
{
    // Vlastní funkce na vytvoření okna
    sfRenderWindow* createWindow(uint width, uint height, uint bpp, const(char)* title, sfUint32 style, const sfContextSettings* settings);
    
    // Funkce na kontrolu velikosti datových typů
    uint sizeofGLenum();
    uint sizeofGLboolean();
    uint sizeofGLbitfield();
    uint sizeofGLsizei();
    uint sizeofGLbyte();
    uint sizeofGLshort();
    uint sizeofGLint();
    uint sizeofGLubyte();
    uint sizeofGLushort();
    uint sizeofGLuint();
    uint sizeofGLfloat();
    uint sizeofGLclampf();
    uint sizeofGLdouble();
    uint sizeofGLclampd();
}

static this()
{
    foreach( T; TypeTuple!( "GLenum", "GLboolean", "GLbitfield", "GLsizei",
                            "GLbyte", "GLshort", "GLint", 
                            "GLubyte", "GLushort", "GLuint",
                            "GLfloat", "GLclampf", "GLdouble", "GLclampd" ) )
    {
        assert( mixin( "sizeof" ~ T ~ "() == " ~ T ~ ".sizeof" ), "Sizes of " ~ T ~ " do not match!" );
    }
}

class ClientGraphicsMgr : IGraphicsMgr
{
    this( IGame game )
    {
        m_game = game;
        m_screenSize = vec2i( 800, 600 );
  
        sfContextSettings Settings = { 24, 8, 0 };
        sfVideoMode Mode = { m_screenSize[0], m_screenSize[1], 32 };
        
        enforce( m_window = createWindow( 800, 600, 32, "JAMC window", sfResize | sfClose, &Settings), "Couldn't create window." );
        
        game.logger.notice( "Loaded " ~ to!string( loadGLFunctions() ) ~ " OpenGL functions." );
    }
    
    ~this()
    {
        sfRenderWindow_destroy( m_window );
    }
    
    override void beginFrame()
    {
        // zpracujeme udalosti
        sfEvent event;
        while( sfRenderWindow_pollEvent( m_window, &event ) )
        {
            if( event.type == sfEventType.sfEvtClosed )
            {
                m_game.events.raise( new UserQuitRequest() );
            }
        }
     
        glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT );
    }
    
    override void finishFrame()
    {
        GLenum err;
        while( ( err = glGetError() ) != GL_NO_ERROR )
        {
            writeln( "Chyba OpenGL: ", gluErrorString( err ) );
        }
        
        
        sfRenderWindow_display( m_window );
    }

    override @property vec2i screenSize()
    {
        return m_screenSize;
    }

private:
    IGame m_game;
    sfRenderWindow* m_window;
    vec2i m_screenSize;
    
    uint[2] m_buffers;
    
}



