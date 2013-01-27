module jamc.client.sockets;
import jamc.api.logger;
import jamc.api.game;
import jamc.api.configuration;

import std.stdio;
import std.socket;
import std.stream;
import std.socketstream;

import std.conv;
import core.thread;

class SocketClient
{
private:
    IGame game;
    string serverAddr;
    ushort serverPort;
    Socket server;

public:
    this(IGame game, string serverAddr, ushort serverPort){
        this.game = game;
        this.serverAddr = serverAddr;
        this.serverPort = serverPort;
    }
    
    void connect(){
        game.logger.notice("connecting to the server...");
        server = new TcpSocket(new InternetAddress(serverAddr,serverPort));
        server.blocking = false;
    }
    
    void disconnect(){
        game.logger.notice("disconnecting from the server...");
        server.close();
    }
    
    void reconnect(){
        connect();
        // TODO: znovu prihlasit
        disconnect();
    }
    
    void write(const(void)[] data){
        game.logger.notice("writing to the server...");
        if(server.send(data) == Socket.ERROR){
            game.logger.warning("cannot write to the server!");
        }
    }
    
    void tryRead(){
        char buffer[] = new char[32];
        auto loaded = server.receive(buffer);
        if(loaded == Socket.ERROR){
            game.logger.warning("cannot read from the server!");
        }
        if(loaded > 0){
            
            // TODO: zde by se pak melo rozparsovat co dorazilo a zavolat patricne funkce
            game.logger.notice("readed from the server: " ~ to!string(buffer));
            writeln("Prijato " ~ to!string(loaded) ~ " bytu: " ~ to!string(buffer));
            
        }
    }
    
}
