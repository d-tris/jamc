module jamc.common.game;

import jamc.api.game;
import jamc.api.graphics;

import GL.glfw;

version( server ) import jamc.server.graphics;
version( client ) import jamc.client.graphics;

class JamcGame : IGame
{
    this()
    {
        version( server )
        {
            m_graphicsMgr = new ServerGraphicsMgr();
        }
        version( client )
        {
            m_graphicsMgr = new ClientGraphicsMgr();
        }
    }
    override int run()
    {
        bool run = true;
        while( run )
        {
            //herni logika jde sem
            
            m_graphicsMgr.beginFrame();
            // kresleni sceny jde sem
            m_graphicsMgr.finishFrame();
            
            // zda mame pokracovat bude nutne tahat pres nejakou 
            // abstrakci, ale zatim staci tohle
            version( client ) run = cast( bool ) glfwGetWindowParam( GLFW_OPENED );
            version( server ) run = false;

        }
        return 0;
    }
    
private:
    IGraphicsMgr m_graphicsMgr;
}

int main()
{
    return ( new JamcGame() ).run();
}
