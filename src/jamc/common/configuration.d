module jamc.common.configuration;
import jamc.api.game;

import std.xml;
import std.variant;
import std.file;
import std.stdio;
import std.conv;
import std.traits;
import jamc.common.logger;
import jamc.common.game;

struct ServerConf {
  string servername;
  int port;
}

void loadConfiguration( T )( IGame game, out T data, string filename ){
  try{
    string file = cast(string) std.file.read( filename );
    std.xml.check(file);
    DocumentParser xml = new DocumentParser(file);
    
    foreach( member; __traits(allMembers, T) ){
      xml.onEndTag[ member ] = (in Element e) { // BUG!
        
        writeln("member=" ~ member); // vypise pokazde toho sameho clena!
        // misto toho lze pouzit e.tag.name, ale na to nelze pouzit typeof()
        
        __traits(getMember, data, member) = to!( typeof( __traits(getMember,data,member) ) )( e.text() );
        
      };
    }
    
    xml.parse();
  }
  catch(FileException e){
    game.logger.error( "can't open configuration file: " ~ filename );
  }
  catch(CheckException e){
    game.logger.error( "bad validation result of configuration file: " ~ filename );
  }
  game.logger.notice("configuration loaded");
}

