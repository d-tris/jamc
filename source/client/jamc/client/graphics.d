module jamc.client.graphics;


import std.conv;
import std.exception;
import std.stdio;
import std.typetuple;

import jamc.api.eventTypes;
import jamc.api.game;
import jamc.api.graphics;
import jamc.util.vector;
import jamc.util.gpu.gl;

import derelict.sdl2.sdl;
import derelict.opengl3.gl;

class ClientGraphicsMgr : IGraphicsMgr
{
    this( IGame game )
    {
        m_game = game;
		DerelictSDL2.load();
		DerelictGL.load();
		
		m_screenSize = vec2i(800, 600);
		
		SDL_Init(SDL_INIT_VIDEO);
		_window = enforce(SDL_CreateWindow(
			"JAMC window", 
			SDL_WINDOWPOS_UNDEFINED,
			SDL_WINDOWPOS_UNDEFINED, 
			m_screenSize.x,
			m_screenSize.y,
			SDL_WINDOW_SHOWN|SDL_WINDOW_OPENGL),
			"Couldn't create window");
		
		_glctx = SDL_GL_CreateContext(_window);
		
		DerelictGL.reload();
		
		initGlExtensions();
    }
    
    ~this()
    {
		SDL_GL_DeleteContext(_glctx);
		SDL_DestroyWindow(_window);
    }
    
    override void beginFrame()
    {
        // zpracujeme udalosti
        SDL_Event event;
        while (SDL_PollEvent(&event))
        {            
            if (event.type == SDL_MOUSEMOTION)
            {
                auto sfEvt = event.motion;
                auto newPosition = vec2i( sfEvt.x, sfEvt.y );
                auto delta = newPosition - m_mousePosition;
                m_mousePosition = newPosition;
                scope e = new MouseMoveEvent( m_mousePosition, delta );
                m_game.events.raise( e );
            }
            
            if (event.type == SDL_MOUSEBUTTONUP)
            {
                scope e = new KeyPressEvent( vec2i( event.button.x, event.button.y ), cast(Key)( Key.MouseLeft + event.button.button ) );
                m_game.events.raise( e );
            }
            
            if (event.type == SDL_MOUSEBUTTONUP)
            {
                scope e = new KeyReleaseEvent( vec2i( event.button.x, event.button.y ), cast(Key)( Key.MouseLeft + event.button.button ) );
                m_game.events.raise( e );
            }
            
            if (event.type == SDL_KEYDOWN)
            {
                scope e = new KeyPressEvent( vec2i( 0, 0 ), cast(Key) event.key.keysym.sym );
                m_game.events.raise( e );
            }
            
            if (event.type == SDL_KEYUP)
            {
                scope e = new KeyReleaseEvent( vec2i( 0, 0 ), cast(Key) event.key.keysym.sym );
                m_game.events.raise( e );
            }
            
            if (event.type == SDL_QUIT
				|| (event.type == SDL_WINDOWEVENT && event.window.event == SDL_WINDOWEVENT_CLOSE))
            {
                scope e = new UserQuitRequest();
                m_game.events.raise( e );
            }
        }
     
        glCall!glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT );
    }
    
    override void finishFrame()
    {
        GLenum err;
        while( ( err = glCall!glGetError() ) != GL_NO_ERROR )
        {
            writeln( "Chyba OpenGL: ", err);
        }
        
        SDL_GL_SwapWindow(_window);
    }

    override @property vec2i screenSize()
    {
        return m_screenSize;
    }

private:
    IGame m_game;
    SDL_Window* _window;
    SDL_GLContext _glctx;
    vec2i m_screenSize;
    
    uint[2] m_buffers;
    
    vec2i m_mousePosition;
    
}



