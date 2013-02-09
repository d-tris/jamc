# Mozna bych pouzil jiny system kompilace, treba dsss, ale tohle zatim staci

SRCDIR=src
RDMDFLAGS=-g -I$(SRCDIR)
CLIENTFLAGS=-L-lcsfml-graphics -L-lcsfml-window -L-lsfml-graphics -L-lsfml-window -L-lGL -version=OpenGL
SERVERFLAGS=

all: server client

server:
	rdmd --build-only -version=server -ofserver $(RDMDFLAGS) $(SERVERFLAGS) $(SRCDIR)/jamc/common/game.d

client:
	mkdir -p obj/jamc/client/
	gcc -c src/jamc/client/graphics.c -o obj/jamc/client/graphics.o
	rdmd -c --build-only -version=client -ofobj/client.o $(RDMDFLAGS) $(CLIENTFLAGS) $(SRCDIR)/jamc/common/game.d 
	dmd obj/client.o obj/jamc/client/graphics.o -ofclient $(RDMDFLAGS) $(CLIENTFLAGS)

.PHONY: all clean server client

clean:
	rm -rf obj client server client.log server.log

