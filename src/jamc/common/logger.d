module jamc.common.logger;
import jamc.api.logger;
import jamc.api.game;

import std.stdio;
import std.datetime;

class Logger : ILogger
{
private:
    File f;
    level logLevel;
    bool toConsole;
    IGame game;
    
public:
    enum level { notice=1, warning=2, error=3 };
    
    this(IGame game, level logLevel, bool toConsole, string filename)
    {
        f = File(filename, "a");
        this.logLevel = logLevel;
        this.toConsole = toConsole;
        this.game = game;
    }
    
    ~this()
    {
        f.close();
    }
    
    string getTime()
    {
        auto st = Clock.currTime();
        auto dateTime = cast(DateTime)st;
        return dateTime.toString();
        
    }
    
    void notice(string text)
    {
        if(logLevel<=level.notice){
            string output = getTime() ~ " Notice: " ~ text;
            f.writeln( output );
            if(toConsole) writeln( output );
        }
    }
    
    void warning(string text)
    {
        if(logLevel<=level.warning){
            string output = getTime() ~ " Warning: " ~ text;
            f.writeln( output );
            if(toConsole) writeln( output );
        }
    }
    
    void error(string text)
    {
        if(logLevel<=level.error){
            string output = getTime() ~ " Error: " ~ text;
            f.writeln( output );
            if(toConsole) writeln( output );
        }
    }
    
}

