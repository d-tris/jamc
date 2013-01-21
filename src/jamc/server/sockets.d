module jamc.server.sockets;
import jamc.api.logger;
import jamc.api.game;
import jamc.api.configuration;

import std.stdio;
import std.socket;
import std.socketstream;
import std.conv;
import core.thread;

class SocketServer
{
private:
    IGame game;
    ServerConf configuration;
    Socket listener;
    Socket[] clients;
    
public:
    
    this(IGame game, ServerConf configuration){
        this.game = game;
        this.configuration = configuration;
        listener = new TcpSocket;
        listener.blocking = false;
        listener.bind(new InternetAddress(configuration.port));
        listener.listen(10);
    }
    
    ~this(){
        listener.close();
    }
    
    void killClient(int i){
        clients[i].close();
        if(i != clients.length-1) clients[i] = clients[clients.length - 1];
        clients = clients[0 .. clients.length - 1];
        game.logger.notice("client closed connection");
    }
    
    void handleClients(){
        // Prijem novych klientu
        try{
            Socket newsocket = listener.accept();
            newsocket.blocking = false;
            clients ~= newsocket;
            game.logger.notice("client opened connection");
        }
        catch(SocketAcceptException e){}
        
        // Naslouchani klientum
        char buffer[] = new char[32];
        for(int i=0 ; i < clients.length ; i++){
            long loaded = clients[i].receive(buffer);
            
            if(loaded == Socket.ERROR){
                killClient(i);
                continue;
            }
            if(loaded > 0){
                
                // TODO: zde by se pak melo rozparsovat co dorazilo a zavolat patricne funkce
                game.logger.notice("readed " ~ to!string(loaded) ~ " bytes from the server: " ~ to!string(buffer));
                
            }
        }
    }
    
    void write(int i, const(void)[] data){
        game.logger.notice("writing to client " ~ to!string(i) ~ "...");
        if(clients[i].send(data) == Socket.ERROR){
            killClient(i);
            game.logger.warning("cannot write to client " ~ to!string(i) ~ "!");
        }
    }
    
    void writeToAll(const(void)[] data){
        for(int i=0 ; i < clients.length ; i++){
            write(i,data);
        }
    }
}

