# Mozna bych pouzil jiny system kompilace, treba dsss, ale tohle zatim staci

SRCDIR=src
RDMDFLAGS=-g -I$(SRCDIR)
CLIENTFLAGS=-L-lglfw
SERVERFLAGS=

all: server client

server:
	rdmd --build-only -version=server -ofserver $(RDMDFLAGS) $(SERVERFLAGS) $(SRCDIR)/jamc/common/game.d

client:
	rdmd --build-only -version=client -ofclient $(RDMDFLAGS) $(CLIENTFLAGS) $(SRCDIR)/jamc/common/game.d

.PHONY: all server client
