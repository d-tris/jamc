# Mozna bych pouzil jiny system kompilace, treba dsss, ale tohle zatim staci

SRCDIR=src
OBJDIR=obj
RDMDFLAGS=-g -I$(SRCDIR)
CLIENTFLAGS=-L-lcsfml-graphics -L-lcsfml-window -L-lsfml-graphics -L-lsfml-window -L-lGL -L-lGLU -L-lftgl -L-lfreetype -unittest
SERVERFLAGS=

all: server client

server:
	rdmd --build-only -version=server -ofserver $(RDMDFLAGS) $(SERVERFLAGS) $(SRCDIR)/jamc/common/game.d

$(OBJDIR)/jamc/client/graphics.o: $(SRCDIR)/jamc/client/graphics.c
	mkdir -p $(OBJDIR)/jamc/client
	gcc -c src/jamc/client/graphics.c -o obj/jamc/client/graphics.o

$(OBJDIR)/client.o:
	mkdir -p $(OBJDIR)
	rdmd -c --build-only -version=client -ofobj/client.o $(RDMDFLAGS) $(CLIENTFLAGS) $(SRCDIR)/jamc/common/game.d 

client: $(OBJDIR)/jamc/client/graphics.o $(OBJDIR)/client.o
	dmd obj/client.o obj/jamc/client/graphics.o -ofclient $(RDMDFLAGS) $(CLIENTFLAGS)

trace:
	apitrace trace -o client.trace ./client
	apitrace dump client.trace

.PHONY: all clean server trace $(OBJDIR)/client.o

clean:
	rm -rf obj client server client.log server.log




