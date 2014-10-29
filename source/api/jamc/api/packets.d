module jamc.api.packets;

enum packetType {
  /*** Prihlasovaci sekvence ***/
  loginSaltRequest, // klient zada server o sul
  loginSaltReply, // server posila klientovi sul
  loginRequest, // klient posila osolene prihlasovaci udaje
  loginDenied, // server zamita prihlaseni
  loginAccepted, // server prijma prihlaseni
}

alias Salt = string;

struct LoginRequest {
  string login;
  ubyte[] password;
}

