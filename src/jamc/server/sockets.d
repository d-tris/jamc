module jamc.server.sockets;
import jamc.api.logger;
import jamc.api.game;
import jamc.api.configuration;

import std.stdio;
import std.socket;
import std.digest.sha;
import std.conv;
import core.thread;

class SocketServer
{
private:
    IGame game;
    ServerConf configuration;
    Socket listener;
    string[string] clients; // pole pripojenych klientu (zatim obsahuje login, pozdeji objekt hrace)    
    
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
        char buffer[] = new char[128];
        Address from;
        long loaded = listener.receiveFrom(buffer,from);
        
        if( loaded != Socket.ERROR && loaded > 0 ){ // pokud nektery klient neco zaslal
            
            game.logger.notice( "readed " ~ to!string(loaded) ~ " bytes from the client " ~ from.toAddrString() ~ ":" ~ from.toPortString() ~ ": " ~ to!string(buffer) );
            
            if(!clients.get(from.toString(),null)){ // neprihlaseny
                
                if(buffer[0]==0xFF){ // prihlasuje se
                    
                    string potentialUsername = to!string(buffer[ 2 .. 2+buffer[1] ]);
                    string potentialPassword = to!string(buffer[ 2+buffer[1]+1 .. 2+buffer[1]+1 + buffer[2+buffer[1]] ]);
                    
                    // prozatim jsou prihlaseni vsichni, kteri zadaji heslo "bagr"
                    
                    if( potentialPassword == cast(string)digest!SHA1(potentialUsername ~ "bagr") ){
                        // prihlasen
                        clients[from.toString()] = potentialUsername;
                        game.logger.notice( "Prihlasen \"" ~ potentialUsername ~ "\" s heslem \"" ~ potentialPassword ~ "\"" );
                    }else{
                        // pristup odepren
                        listener.sendTo(to!string(cast(char)0xFE), from);
                        game.logger.notice( "Pristup odepren pro \"" ~ potentialUsername ~ "\" s heslem \"" ~ potentialPassword ~ "\"" );
                    }
                    
                }else{ // neprihlaseny a nevi o tom
                    listener.sendTo(to!string(cast(char)0xFF), from);
                }
                
            }else{ // prihlaseny
                
                game.logger.notice( "Ozval se klient " ~ clients[from.toString()] ~ " z " ~ from.toString() );
                
                // test odpovedi klientovi
                listener.sendTo("ahoj kliente!\0", from);
                
            }
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

