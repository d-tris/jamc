module jamc.client.sockets;
import jamc.api.logger;
import jamc.api.game;
import jamc.api.configuration;

import std.stdio;
import std.socket;
import std.stream;
import std.digest.sha;

import std.conv;
import core.thread;

class SocketClient
{
private:
    IGame game;
    ClientConf configuration;
    Socket server;
    string username, password;

public:
    this(IGame game, ClientConf configuration){
        this.game = game;
        this.configuration = configuration;
    }
    
    void connect(){
        game.logger.notice("connecting to the server...");
        Address[] addresses;
        try{
         addresses = getAddress(configuration.server,configuration.port);
        }
        catch(SocketOSException e){
            game.logger.error("cannot get address of server \"" ~ configuration.server ~ "\"!");
            throw e;
        }
        game.logger.notice("address of server is " ~ addresses[0].toString());
        server = new UdpSocket(addresses[0].addressFamily);
        server.blocking = false;
        server.connect(addresses[0]);
    }
    
    void disconnect(){
        game.logger.notice("disconnecting from the server...");
        server.close();
    }
    
    void reconnect(){
        connect();
        login();
        disconnect();
    }
    
    void write(const(void)[] data){
        game.logger.notice("writing to the server...");
        if(server.send(data) == Socket.ERROR){
            game.logger.warning("cannot write to the server!");
        }
    }
    
    void handleServer(){
        char buffer[] = new char[32];
        auto loaded = server.receive(buffer);
        if( loaded != Socket.ERROR && loaded > 0 ){ // pokud server neco zaslal

            game.logger.notice("readed from the server: " ~ to!string(buffer));
            
            if(buffer[0]==0xFF && loaded>=5){ // prisla vyzva k prihlaseni (obsahujici sul)

                string salt = to!string(buffer[ 1 .. 5 ]);
                game.logger.notice("server require login with salt " ~ salt);
                string passwordhash = cast(string) digest!SHA1(username ~ password ~ salt);
                
                this.write( to!string(cast(char)0xFF) ~ to!string(cast(char)(username.length)) ~ username ~ to!string(cast(char)(passwordhash.length)) ~ passwordhash );
                
            }
            
            // TODO: zde by se pak melo rozparsovat co dorazilo a zavolat patricne funkce
            
        }
    }
    
    void login(string username, string password){
        this.username=username;
        this.password=password;
        this.login();
    }
    
    void login(){
        this.write(to!string(cast(char)0x00)); // prazdna instrukce pouze vyvola vyzvu k prihlaseni
    }
}
