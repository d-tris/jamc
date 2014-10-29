module jamc.api.configuration;

import jamc.common.configuration;

struct ServerConf {
    @Required string servername;
    ushort port;
    uint maxconnections;
}

struct ClientConf {
    string server;
    ushort port;
    @Required string login;
    @Required string password;
}

