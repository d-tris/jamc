module jamc.client.sockets;
import jamc.api.logger;
import jamc.api.game;
import jamc.api.configuration;

import std.stdio;
import std.socket;
import std.stream;
import std.socketstream;

class SocketClient
{
private:
    IGame game;
    string serverAddr;
    ushort serverPort;
    Socket socket;
    Stream stream;

public:
    this(IGame game, string serverAddr, ushort serverPort){
        this.game = game;
        this.serverAddr = serverAddr;
        this.serverPort = serverPort;
    }
    
    void connect(){
        game.logger.notice("connecting to the server...");
        
        socket = new TcpSocket(new InternetAddress(serverAddr,serverPort));
        stream = new SocketStream(socket);
        
        // test zapisu
        stream.write("ahoj");
        
        // test cteni (precte 20 bytu a vypise)
        char[] buffer = new char[20];
        stream.readExact(buffer,20);
        writeln(buffer);
    }
    
    void disconnect(){
        game.logger.notice("disconnecting from the server...");
        stream.close();
        socket.close();
    }
}
