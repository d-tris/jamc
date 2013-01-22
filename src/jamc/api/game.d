module jamc.api.game;

import jamc.api.events;
import jamc.api.graphics;
import jamc.api.logger;


interface IGame
{
    /**
     * Vstupni bod hry. 
     * Vraci cislo pouzitelne jako navratovy kod aplikace.
     */
    int run();
    
    @property IEventDispatcher events();
    @property IGraphicsMgr gfx();
    @property ILogger logger();
}
