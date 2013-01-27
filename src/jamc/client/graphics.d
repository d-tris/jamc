module jamc.client.graphics;


import std.conv;
import std.exception;
import std.range;
import std.string;
import std.traits;
import std.typecons;

import jamc.api.eventTypes;
import jamc.api.game;
import jamc.api.graphics;
import GL.gl;
import CSFML.Graphics.All;
import CSFML.Window.All;

version(Windows)
{
    // Winows
    extern(System) void function() wglGetProcAddress( const(char)* proc );
    alias glGetProcAddress = wglGetProcAddress;
}
else
{
    // ostatni na X zalozene OS
    extern(System) void function() glXGetProcAddress( const(char)* proc );
    alias glGetProcAddress = glXGetProcAddress;
}

class ClientGraphicsMgr : IGraphicsMgr
{
    this( IGame game )
    {
        m_game = game;
  
        sfContextSettings Settings = {24, 8, 0};
        sfVideoMode Mode = {800, 600, 32};
        
        enforce( m_window = sfRenderWindow_create(Mode, "JAMC window", sfResize | sfClose, &Settings), "Couldn't create window." );

        m_ogl = new OGL();

        m_ogl = new OGL();

        int n;
        foreach( member; __traits( allMembers, OGL ) )
        {
            foreach( attr; __traits( getAttributes, __traits( getMember, this.m_ogl, member ) ) )
            {
                static if( isInstanceOf!( OGL.LoadGL, attr ) )
                {   
                    loadOGLFunction( __traits( getMember, this.m_ogl, member ), attr.names );
                    n++;
                }
            }
        }
        game.logger.notice( "Loaded " ~ to!string( n ) ~ " OpenGL functions." );
    }
    
    static void loadOGLFunction( T )( out T target, string[] names... )
    {
        foreach( name; names )
        {
            target = cast( T ) glGetProcAddress( toStringz( name ) );
            if( target !is null )
            {
                break;
            }
        }
        
        target = enforce( target );
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
    }
    
    override void finishFrame()
    {
        sfRenderWindow_display( m_window );
    }
    
    override @property OGL ogl()
    {
        return m_ogl;
    }

private:
    IGame m_game;
    OGL m_ogl;
    sfRenderWindow* m_window;
    
}



