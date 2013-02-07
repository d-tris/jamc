module jamc.client.graphics;


import std.conv;
import std.exception;

import jamc.api.eventTypes;
import jamc.api.game;
import jamc.api.graphics;
import jamc.util.gpu.gl;
import CSFML.Graphics.All;
import CSFML.Window.All;
import CSFML.Config;

// Vlastní funkce na vytvoření okna
extern(C) sfRenderWindow* createWindow(uint width, uint height, uint bpp, const(char)* title, sfUint32 style, const sfContextSettings* settings);

class ClientGraphicsMgr : IGraphicsMgr
{
    this( IGame game )
    {
        m_game = game;
  
        sfContextSettings Settings = {24, 8, 0};
        sfVideoMode Mode = {800, 600, 32};
        
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
    }
    
    override void finishFrame()
    {
        sfRenderWindow_display( m_window );
    }

private:
    IGame m_game;
    sfRenderWindow* m_window;
    
}



