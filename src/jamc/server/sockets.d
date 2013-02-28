module jamc.server.sockets;
import jamc.api.logger;
import jamc.api.game;
import jamc.api.configuration;
import jamc.api.packets;
import jamc.api.network;

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
        ubyte buffer[];
        buffer.length = 128;
        Address from;
        
        long loaded = listener.receiveFrom(buffer,from);
        if( loaded != Socket.ERROR && loaded > 0 ){ // pokud nektery klient neco zaslal
            
            if(!(from.toString() in clients)){ // neprihlaseny
                
                // prihlasuje se a zname jeho sul
                if(packetDecodeId(buffer)==packetType.loginRequest && from.toString() in salts){
                    
                    LoginRequest request;
                    packetDecodeData(request, buffer);
                    
                    if( request.password == digest!SHA1( request.login ~ "bagr" ~ salts[from.toString()].salt ) ){
                        // prihlasen
                        clients[from.toString()] = request.login;
                        game.logger.notice( "logged " ~ request.login );
                    }else{
                        // pristup odepren
                        listener.sendTo( to!string( cast(char) packetType.loginDenied ), from );
                        game.logger.notice( "rejected " ~ request.login );
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
                    listener.sendTo( to!string(cast(char)packetType.loginSaltReply) ~ saltString , from);
                    
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

