module jamc.api.logger;

interface ILogger
{
    void notice(string text);
    void warning(string text);
    void error(string text);
}
