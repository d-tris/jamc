module jamc.api.game;

import jamc.api.logger;

interface IGame
{
    /**
     * Vstupni bod hry. 
     * Vraci cislo pouzitelne jako navratovy kod aplikace.
     */
    int run();
    
    @property ILogger logger();
}
