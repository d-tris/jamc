module jamc.common.configuration;
import jamc.api.game;
import jamc.api.configuration;

import std.array;
import std.xml;
import std.file;
import std.conv;
import std.traits;
import std.typetuple;
import jamc.common.logger;
import jamc.common.game;

struct Required{}

void loadConfiguration( T )( IGame game, ref T data, string filename )
if( is( T == struct ) )
{
    try{
        scope(success) game.logger.notice( "configuration loaded" );
        
        string file = cast(string) read( filename );
        check(file);
        auto xml = new Document( file );
        
        bool[] loaded;
        loaded.length = __traits( allMembers, T ).length;
        
        foreach( e; xml.elements )
        {
            foreach( i, member; __traits( allMembers, T ) )
            {
                if( e.tag.name == member )
                {
                    if( loaded[i] )
                    {
                        game.logger.warning( 
                            "Duplicate value of '" 
                            ~ member ~ "' in configuration file '" 
                            ~ filename ~ "'" 
                        );
                    }
                    else
                    {
                        try
                        {
                            __traits( getMember, data, member ) = 
                                to!( typeof( __traits( getMember, data, member ) ) )( e.text() );
                            loaded[i] = true;
                        }
                        catch( ConvException )
                        {
                            game.logger.warning( 
                                "Incorrect type of value '"
                                ~ member ~ "' in configuration file '"
                                ~ filename ~ "'. Falling back to default value of '"
                                ~ to!string( __traits( getMember, data, member ) )
                                ~ "'." 
                            );
                        }
                    }
                }
            }
        }
        
        string[] notLoaded;
        
        foreach( i, member; __traits( allMembers, T ) )
        {
            if( 
                staticIndexOf!( 
                    Required,
                    __traits( 
                        getAttributes, 
                        __traits( getMember, data, member ) 
                    )
                ) != -1 && !loaded[i] 
            )
            {
                notLoaded ~= "  - '" ~ member ~ "' of type '" 
                             ~ typeof( __traits( getMember, data, member ) ).stringof
                             ~ "'";
            }
        }
        
        if( !notLoaded.empty )
        {
            throw new Exception( 
                "The following required values could not be loaded from the configuration file '"
                ~ filename ~ "'.\n" ~ join( notLoaded, "\n" )
            );
        }        
    }
    catch(FileException e){
        game.logger.error( "Can't open configuration file: " ~ filename );
    }
    catch(CheckException e){
        game.logger.error( "Configuration file '" ~ filename ~ "' is not a valid XML document ");
    }
}

