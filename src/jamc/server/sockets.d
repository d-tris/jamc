module jamc.server.sockets;
import jamc.api.logger;
import jamc.api.game;
import jamc.api.configuration;

import std.stdio;
import std.socket;
import std.digest.sha;
import std.conv;
import core.thread;
import std.datetime;
import std.random;

struct Salt {
    string salt;
    //SysTime generated; // TODO
}

class SocketServer
{
private:
    IGame game;
    ServerConf configuration;
    Socket listener;
    string[string] clients; // pole pripojenych klientu (zatim obsahuje login tedy string, pozdeji objekt hrace)
    Salt[string] salts; // pole soli pripojujicich se klientu
    
public:
    
    this(IGame game, ServerConf configuration){
        this.game = game;
        this.configuration = configuration;
        listener = new UdpSocket(AddressFamily.INET6);
        listener.blocking = false;
        listener.bind(new Internet6Address(configuration.port));
    }
    
    ~this(){
        listener.close();
    }
    
    void handleClients(){
        char buffer[] = new char[128];
        Address from;
        long loaded = listener.receiveFrom(buffer,from);
        
        if( loaded != Socket.ERROR && loaded > 0 ){ // pokud nektery klient neco zaslal
            
            //game.logger.notice( "readed " ~ to!string(loaded) ~ " bytes from the client " ~ from.toAddrString() ~ ":" ~ from.toPortString() ~ ": " ~ to!string(buffer) );
            
            if(!(from.toString() in clients)){ // neprihlaseny
                
                // prihlasuje se a zname jeho sul
                if(buffer[0]==0xFF && from.toString() in salts){
                    
                    string potentialUsername = to!string(buffer[ 2 .. 2+buffer[1] ]);
                    string potentialPassword = to!string(buffer[ 2+buffer[1]+1 .. 2+buffer[1]+1 + buffer[2+buffer[1]] ]);
                    
                    if( potentialPassword == cast(string)digest!SHA1( potentialUsername ~ "bagr" ~ salts[from.toString()].salt ) ){
                        // prihlasen
                        clients[from.toString()] = potentialUsername;
                        game.logger.notice( "logged " ~ potentialUsername );
                    }else{
                        // pristup odepren
                        listener.sendTo(to!string(cast(char)0xFE), from);
                        game.logger.notice( "rejected " ~ potentialUsername );
                    }
                    
                }else{
                    // neprihlaseny a nevi o tom, nebo prvotni pozadavek, nebo se prihlasuje, ale my uz nemame jeho sul
                    // posleme ze se musi prihlasit + novou sul hesla
                    string saltString;
                    if(from.toString() in salts){
                        saltString = salts[from.toString()].salt;
                        game.logger.notice( "for " ~ from.toString() ~ " is salt " ~ saltString );
                    }else{
                        Random gen = Random(unpredictableSeed);
                        saltString = to!string([ uniform('0','9',gen), uniform('0','9',gen), uniform('0','9',gen), uniform('0','9',gen) ]);
                        salts[from.toString()] = Salt(saltString);
                        game.logger.notice( "generated salt " ~ saltString ~ " for " ~ from.toString() );
                    }
                    listener.sendTo( to!string(cast(char)0xFF) ~ saltString , from);
                }
                
            }else{ // prihlaseny
                
                game.logger.notice( clients[from.toString()] ~ " (" ~ from.toString() ~ "): " ~ to!string(buffer) );
                
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

