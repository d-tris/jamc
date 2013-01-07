module jamc.common.configuration;
import jamc.api.configuration;
import jamc.api.game;

import std.xml;
import std.file;
import std.stdio;
import std.conv;
import jamc.common.logger;
import jamc.common.game;

class Configuration : IConfiguration
{
private:
    string filename;
    IGame game;
    
public:
    string servername;
    int port;
    
    this(IGame game, string filename){
        this.filename = filename;
        this.game = game;
        try{
            string file = cast(string) std.file.read( filename );
            std.xml.check(file);
            DocumentParser xml = new DocumentParser(file);
            
            xml.onEndTag["servername"] = (in Element e) { this.servername=e.text(); };
            xml.onEndTag["port"] = (in Element e) { this.port=to!int(e.text()); };
            
            xml.parse();
        }
        catch(FileException e){
            game.logger.error( "can't open configuration file: " ~ filename );
        }
        catch(CheckException e){
            game.logger.error( "bad validation result of configuration file: " ~ filename );
        }
        game.logger.notice("configuration loaded");
        writeln("servername: "~this.servername);
        writeln("port: "~to!string(this.port));
    }
}
