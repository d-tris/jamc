module jamc.server.sockets;
import jamc.api.logger;
import jamc.api.game;
import jamc.api.configuration;

import std.stdio;
import std.socket;
import core.thread;

class SocketServer
{
    ServerConf configuration;
    
    this(IGame game, ServerConf configuration){
        this.configuration = configuration;
        
        // podle https://github.com/D-Programming-Language/dmd/blob/master/samples/listener.d
        
        Socket listener = new TcpSocket;
        assert(listener.isAlive);
        listener.blocking = false;
        listener.bind(new InternetAddress(configuration.port));
        listener.listen(10);
        
        SocketSet sset = new SocketSet(configuration.maxconnections + 1);
        Socket[]  reads;
        
        for (;; sset.reset()) {
            sset.add(listener);
            foreach (Socket each; reads) {
                sset.add(each);
            }
            Socket.select(sset, null, null);
            int i;
            for (i = 0;; i++) {
        next:
                if (i == reads.length) break;
                if (sset.isSet(reads[i])) {
                    char[1024] buf;
                    int read = cast(int)reads[i].receive(buf);
                    
                    if (Socket.ERROR == read) {
                        writeln("Connection error.");
                        goto sock_down;
                    }
                    else if (0 == read) {
                        try{
                            // if the connection closed due to an error, remoteAddress() could fail
                            writefln("Connection from %s closed.", reads[i].remoteAddress().toString());
                        }
                        catch (SocketException) {
                            writeln("Connection closed.");
                        }
                    
                     sock_down:
                        reads[i].close(); // release socket resources now
                        // remove from -reads-
                        if (i != reads.length - 1) reads[i] = reads[reads.length - 1];
                        reads = reads[0 .. reads.length - 1];
                        writefln("\tTotal connections: %d", reads.length);
                        goto next; // -i- is still the next index
                    } else {
                        writefln("Received %d bytes from %s: \"%s\"", read, reads[i].remoteAddress().toString(), buf[0 .. read]);
                    }
                }
            }
            
            if (sset.isSet(listener)) { // connection request
                Socket sn;
                try {
                    if (reads.length < configuration.maxconnections) {
                        sn = listener.accept();
                        writefln("Connection from %s established.", sn.remoteAddress().toString());
                        assert(sn.isAlive);
                        assert(listener.isAlive);
                        
                        reads ~= sn;
                        writefln("\tTotal connections: %d", reads.length);
                    } else {
                        sn = listener.accept();
                        writefln("Rejected connection from %s; too many connections.", sn.remoteAddress().toString());
                        assert(sn.isAlive);
                        sn.close();
                        assert(!sn.isAlive);
                        assert(listener.isAlive);
                    }
                }
                catch (Exception e) {
                    writefln("Error accepting: %s", e.toString());
                    if (sn) sn.close();
                }
            } // endif
        } // endfor
    }
}

