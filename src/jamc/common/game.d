module jamc.common.game;

import jamc.api.game;
import jamc.api.graphics;

import GL.glfw;

import jamc.common.logger;
import jamc.common.configuration;

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
        logger = new Logger( Logger.level.notice, true, "test.log" );
        configuration = new Configuration( "config.xml" );
    }
    override int run()
    {
        version( client ) logger.notice("Client is starting...");
        version( server ) logger.notice("Server is starting...");
        
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
    Logger logger;
    Configuration configuration;
}

int main()
{
    return ( new JamcGame() ).run();
}
