module jamc.common.configuration;

import std.xml;
import std.file;
import std.stdio;
import jamc.common.logger;

class Configuration
{
private:
    string filename;
    
public:
    this(string filename){
        this.filename = filename;
        try{
            string file = cast(string) std.file.read( filename );
        }
        catch(FileException e){
            //error( "can't open configuration file: " ~ filename );
        }
    }
    
    
}
