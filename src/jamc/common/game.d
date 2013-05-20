module jamc.common.game;

import std.stdio;
import std.conv;
import core.thread;
import std.socket;

import jamc.api.game;
import jamc.api.events;
import jamc.api.eventTypes;
import jamc.api.font;
import jamc.api.graphics;
import jamc.api.gui;
import jamc.api.logger;
import jamc.api.configuration;
import jamc.api.widgets.BaseWidget;
import jamc.api.widgets.Button;

import jamc.common.events;
import jamc.common.logger;
import jamc.common.configuration;

version( server )
{
    import jamc.server.sockets;
    import jamc.server.graphics;
    import jamc.server.gui;
}

version( client )
{
    import jamc.client.sockets;
    import jamc.client.font;
    import jamc.client.graphics;
    import jamc.client.gui;
}

import jamc.util.vector;

class JamcGame : IGame
{
private:
    IEventDispatcher _eventDispatch;
    IGraphicsMgr _graphicsMgr;
    ILogger loggerObject;
    IGui _gui;
    IFontMgr _fontMgr;
    
    version(server) ServerConf serverconf;
    version(client) ClientConf clientconf;
    
    version(server) SocketServer socketserver;
    version(client) SocketClient socketclient;
    
public:
    this()
    {
        _eventDispatch = new EventDispatcher();
        
        version( server ){
            loggerObject = new Logger( this, Logger.level.notice, true, "server.log" );
            loadConfiguration( this, serverconf, "server.xml" );
            socketserver = new SocketServer( this, serverconf );
            _graphicsMgr = new ServerGraphicsMgr();
            _gui = new ServerGui();
        }
        version( client ){
            loggerObject = new Logger( this, Logger.level.notice, true, "client.log" );
            loadConfiguration( this, clientconf, "client.xml" );
            socketclient = new SocketClient( this, clientconf );
            _graphicsMgr = new ClientGraphicsMgr( this );
            _fontMgr = new ClientFontMgr();
            _gui = new ClientGui( this );
            
            
            _gui.mainPanel = new BaseWidget( this, vec2i( 0, 0 ), _graphicsMgr.screenSize );
            foreach( x; 0..8 )
            {
                foreach( y; 0..8 )
                {
                    auto button = new Button( _gui.mainPanel, vec2i(200,50) + vec2i(50*x,50*y), vec2i( 49, 49 ) );
                    if( x == 4 && y == 4 )
                    {
                        new Button( button, vec2i( 20, 20 ), vec2i( 49, 49 ) );
                    }
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
                
                _graphicsMgr.beginFrame();
                // kresleni sceny jde sem
                _gui.draw();
                _graphicsMgr.finishFrame();
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
        return _eventDispatch;
    }
    
    override @property IGraphicsMgr gfx()
    {
        return _graphicsMgr;
    }
    
    override @property IFontMgr fonts()
    {
        return _fontMgr;
    }
    
    override @property ILogger logger()
    {
        return loggerObject;
    }
    
    override @property IGui gui()
    {
        return _gui;
    }
}

int main()
{
    return ( new JamcGame() ).run();
}
