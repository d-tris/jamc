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
import jamc.api.widgets.BaseWidget;
import jamc.api.widgets.Button;

import jamc.common.events;
import jamc.common.logger;
import jamc.common.configuration;

version( server ) import jamc.server.sockets;
version( client ) import jamc.client.sockets;

version( server ) import jamc.server.graphics;
version( client ) import jamc.client.graphics;

version( server ) import jamc.server.gui;
version( client ) import jamc.client.gui;

import jamc.util.vector;

class JamcGame : IGame
{
private:
    IEventDispatcher m_eventDispatch;
    IGraphicsMgr m_graphicsMgr;
    ILogger loggerObject;
    IGui m_gui;
    
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
            m_gui = new ServerGui();
        }
        version( client ){
            loggerObject = new Logger( this, Logger.level.notice, true, "client.log" );
            loadConfiguration!(ClientConf)( this, clientconf, "client.xml" );
            socketclient = new SocketClient( this, clientconf );
            m_graphicsMgr = new ClientGraphicsMgr( this );
            m_gui = new ClientGui( this );
            
            m_gui.mainPanel = new BaseWidget( this, vec2i( 0, 0 ), m_graphicsMgr.screenSize );
            foreach( x; 0..8 )
            {
                foreach( y; 0..8 )
                {
                    new Button( m_gui.mainPanel, vec2i(200,50) + vec2i(50*x,50*y), vec2i( 49, 49 ) );
                }
            }
            
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
        
        while( run ){
            
            version(client){
                socketclient.handleServer();
                socketclient.write("vzbud se ty servre jeden!\0"); // DEBUG
                
                //herni logika jde sem
                
                m_graphicsMgr.beginFrame();
                // kresleni sceny jde sem
                m_gui.draw();
                m_graphicsMgr.finishFrame();
            }

            version( server ){
                socketserver.handleClients();
                socketserver.handleClients();
                // dalsi logika serveru
            }
            
            Thread.sleep( msecs( 50 ) );
        }
        
        version( client ){
            socketclient.disconnect();
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
        return m_gui;
    }
}

int main()
{
    return ( new JamcGame() ).run();
}
