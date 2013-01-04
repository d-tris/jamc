module jamc.client.graphics;

import jamc.api.graphics;
import GL.glfw;

class ClientGraphicsMgr : IGraphicsMgr
{
    this()
    {
        glfwInit();
        if( glfwOpenWindow( 720, 560, 8, 8, 8, 8, 24, 8, GLFW_WINDOW ) == GL_FALSE )
        {
            throw new Exception( "Couldn't create window." );
        }
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
}
