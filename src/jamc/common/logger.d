module jamc.common.logger;

import std.stdio;

class Logger
{
private:
    File f;
    level logLevel;
    bool toConsole;
    
public:
    enum level { notice=1, warning=2, error=3 };
    
    this(level logLevel, bool toConsole, string filename) // Konstruktor
    {
        f = File(filename, "a");
        this.logLevel = logLevel;
        this.toConsole = toConsole;
    }
    
    ~this() // Destruktor
    {
        f.close();
    }
    
    void notice(string text)
    {
        if(logLevel<=level.notice){
            f.writeln( "Notice: " ~ text );
            if(toConsole) writeln( "Notice: " ~ text );
        }
    }
    
    void warning(string text)
    {
        if(logLevel<=level.warning){
            f.writeln( "Warning: " ~ text );
            if(toConsole) writeln( "Warning: " ~ text );
        }
    }
    
    void error(string text)
    {
        if(logLevel<=level.error){
            f.writeln( "Error: " ~ text );
            if(toConsole) writeln( "Error: " ~ text );
        }
    }
    
}

