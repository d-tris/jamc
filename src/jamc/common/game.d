module jamc.common.game;

import std.stdio;
import std.conv;
import jamc.api.game;
import jamc.api.graphics;
import jamc.api.logger;

import GL.glfw;

import jamc.common.logger;
import jamc.common.configuration;

version( server ) import jamc.server.graphics;
version( client ) import jamc.client.graphics;

class JamcGame : IGame
{
private:
    ILogger loggerObject;
    ServerConf configuration;
    IGraphicsMgr m_graphicsMgr;
public:
    this()
    {
        loggerObject = new Logger( this, Logger.level.notice, true, "test.log" );
        loadConfiguration!(ServerConf)(this,configuration,"config.xml");
        writeln("servername: "~configuration.servername);
        writeln("port: "~to!string(configuration.port));
        version( server )
        {
            m_graphicsMgr = new ServerGraphicsMgr();
        }
        version( client )
        {
            m_graphicsMgr = new ClientGraphicsMgr( this );
        }
    }
    override int run()
    {
        version( client ) logger.notice("client is starting...");
        version( server ) logger.notice("server is starting...");
        
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
    ILogger logger(){
        return loggerObject;
    }
}

int main()
{
    return ( new JamcGame() ).run();
}
