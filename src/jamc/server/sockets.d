module jamc.server.sockets;
import jamc.api.logger;
import jamc.api.game;
import jamc.api.configuration;

import std.stdio;
import std.socket;
import std.socketstream;
import std.conv;
import core.thread;

class Client
{
    Address address;
    string login; // pozdeji nahradit objektem hrace
}

class SocketServer
{
private:
    IGame game;
    ServerConf configuration;
    Socket listener;
    
public:
    
    this(IGame game, ServerConf configuration){
        this.game = game;
        this.configuration = configuration;
        listener = new UdpSocket;
        listener.blocking = false;
        listener.bind(new InternetAddress(configuration.port));
    }
    
    ~this(){
        listener.close();
    }
    
    void handleClients(){
        char buffer[] = new char[32];
        Address from;
        long loaded = listener.receiveFrom(buffer,from);
        
        if( loaded != Socket.ERROR && loaded > 0 ){ // pokud nektery klient neco zaslal
            
            game.logger.notice( "readed " ~ to!string(loaded) ~ " bytes from the client " ~ from.toAddrString() ~ ":" ~ from.toPortString() ~ ": " ~ to!string(buffer) );
            
            // test odpovedi klientovi
            listener.sendTo("ahoj kliente!\0", from);
            writeln("odeslano");
            
        }
    }
    
    void write(const(void)[] data, Address to){
        game.logger.notice("writing to client...");
        if(listener.sendTo( data, to ) == Socket.ERROR){
            game.logger.warning("cannot write to client!");
        }
    }
    
    void killClient(int i){
        // jen odstrani klienta z pole pripojenych klientu
    }
    
}

