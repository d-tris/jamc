module jamc.api.game;

import jamc.api.events;
import jamc.api.font;
import jamc.api.graphics;
import jamc.api.gui;
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
    @property IFontMgr fonts();
    @property ILogger logger();
    @property IGui gui();
    
}
