module jamc.common.game;

import std.stdio;
import std.conv;
import jamc.api.game;
import jamc.api.graphics;
import jamc.api.logger;
import jamc.api.configuration;

import GL.glfw;

import jamc.common.logger;
import jamc.common.configuration;
version( server ) import jamc.server.sockets;
version( client ) import jamc.client.sockets;

version( server ) import jamc.server.graphics;
version( client ) import jamc.client.graphics;

class JamcGame : IGame
{
private:
    ILogger loggerObject;
    version(server) ServerConf serverconf;
    version(client) ClientConf clientconf;
    IGraphicsMgr m_graphicsMgr;
    version(server) SocketServer socketserver;
    version(client) SocketClient socketclient;
public:
    this()
    {
        version( server ){
            loggerObject = new Logger( this, Logger.level.notice, true, "server.log" );
            loadConfiguration!(ServerConf)(this,serverconf,"server.xml");
        }
        version( client ){
            loggerObject = new Logger( this, Logger.level.notice, true, "client.log" );
            loadConfiguration!(ClientConf)(this,clientconf,"client.xml");
            socketclient = new SocketClient(this,clientconf.server,clientconf.port);
        }
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
        
        version( client ){
            socketclient.connect();
            socketclient.disconnect();
        }
        
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
        
        version( server ) socketserver = new SocketServer( this, serverconf );
        
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
