module jamc.common.game;

import std.stdio;
import std.conv;
import core.thread;
import std.socket;

import jamc.api.game;
import jamc.api.events;
import jamc.api.eventTypes;
import jamc.api.graphics;
import jamc.api.gui;
import jamc.api.logger;
import jamc.api.configuration;

import jamc.common.events;
import jamc.common.logger;
import jamc.common.configuration;
version( server ) import jamc.server.sockets;
version( client ) import jamc.client.sockets;

version( server ) import jamc.server.graphics;
version( client ) import jamc.client.graphics;

class JamcGame : IGame
{
private:
    IEventDispatcher m_eventDispatch;
    IGraphicsMgr m_graphicsMgr;
    ILogger loggerObject;
    
    version(server) ServerConf serverconf;
    version(client) ClientConf clientconf;
    
    version(server) SocketServer socketserver;
    version(client) SocketClient socketclient;
    
public:
    this()
    {
        m_eventDispatch = new EventDispatcher();
        
        version( server ){
            loggerObject = new Logger( this, Logger.level.notice, true, "server.log" );
            loadConfiguration!(ServerConf)( this, serverconf, "server.xml" );
            socketserver = new SocketServer( this, serverconf );
            m_graphicsMgr = new ServerGraphicsMgr();
        }
        version( client ){
            loggerObject = new Logger( this, Logger.level.notice, true, "client.log" );
            loadConfiguration!(ClientConf)( this, clientconf, "client.xml" );
            socketclient = new SocketClient( this, clientconf );
            m_graphicsMgr = new ClientGraphicsMgr( this );
        }
    }
    override int run()
    {
        version( client ) logger.notice("client is starting...");
        version( server ) logger.notice("server is starting...");
        
        version( client ){
            socketclient.connect();
            socketclient.login(clientconf.login,clientconf.password);
            socketclient.write("ahoj servere!\0");
        }
        
        bool run = true;
        
        events.addListener( (UserQuitRequest e){
            run = false;
        });
        
        version(client) while( run )
        {
            socketclient.handleServer();
            socketclient.write("vzbud se ty servre jeden!\0");
            
            //herni logika jde sem
            
            m_graphicsMgr.beginFrame();
            // kresleni sceny jde sem
            m_graphicsMgr.finishFrame();
            
            Thread.sleep( dur!("msecs")( 200 ) );
        }
        
        version( server ) while(true){
            socketserver.handleClients();
            
            // dalsi logika serveru
            
            Thread.sleep( dur!("msecs")( 200 ) );
        }
        
        return 0;
    }
    
    override @property IEventDispatcher events()
    {
        return m_eventDispatch;
    }
    
    override @property IGraphicsMgr gfx()
    {
        return m_graphicsMgr;
    }
    
    override @property ILogger logger()
    {
        return loggerObject;
    }
    
    override @property IGui gui()
    {
        assert( 0, "GUI ještě není" );
    }
}

int main()
{
    return ( new JamcGame() ).run();
}
