module jamc.common.logger;

import std.stdio;

class Logger {
    
    File f;
    
    this(string filename) // Konstruktor
    {
        f = File(filename, "a");
    }
    
    ~this() // Destruktor
    {
        f.close();
    }
    
    void notice(string text)
    {
        f.write("Notice: ");
        f.writeln(text);
    }
    
    void warning(string text)
    {
        f.write("Warning: ");
        f.writeln(text);
    }
    
    void error(string text)
    {
        f.write("Error: ");
        f.writeln(text);
    }
    
}

