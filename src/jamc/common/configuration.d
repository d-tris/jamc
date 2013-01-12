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
        string file = cast(string) read( filename );
        check(file);
        auto xml = new DocumentParser( file );
        
        void onEnd( string target )( in Element e )
        {
            __traits( getMember, data, target ) = to!( typeof( __traits( getMember, data, target ) ) )( e.text() );
        }
        
        foreach( member; __traits(allMembers, T) )
        {
            xml.onEndTag[ member ] = &( onEnd!( member ) );
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

