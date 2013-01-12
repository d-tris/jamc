module jamc.api.configuration;

struct ServerConf {
    string servername;
    ushort port;
    uint maxconnections;
}

struct ClientConf {
    string server;
    ushort port;
}

