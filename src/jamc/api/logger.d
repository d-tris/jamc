module jamc.api.logger;

interface ILogger
{
    void notice(lazy string text);
    void warning(lazy string text);
    void error(lazy string text);
}
