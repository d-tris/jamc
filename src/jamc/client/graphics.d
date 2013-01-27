module jamc.client.graphics;


import std.conv;
import std.exception;
import std.range;
import std.string;
import std.traits;
import std.typecons;

import jamc.api.game;
import jamc.api.graphics;
import GL.glfw;

class ClientGraphicsMgr : IGraphicsMgr
{
    this( IGame game )
    {
        m_game = game;
        glfwInit();
        enforce( glfwOpenWindow( 720, 560, 8, 8, 8, 8, 24, 8, GLFW_WINDOW ) == GL_TRUE, "Couldn't create window." );

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
    
    void loadOGLFunction(T)( out T target, string[] names... )
    {
        foreach( name; names )
        {
            target = cast( typeof( target ) ) glfwGetProcAddress( toStringz( name ) );
            if( target !is null )
            {
                break;
            }
        }
        
        target = enforce( target );
    }
    
    ~this()
    {
        glfwTerminate();
    }
    
    override void beginFrame()
    {}
    
    override void finishFrame()
    {
        glfwSwapBuffers();
    }
    
    override @property OGL ogl()
    {
        return m_ogl;
    }

private:
    IGame m_game;
    OGL m_ogl;
    
}



