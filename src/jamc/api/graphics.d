module jamc.api.graphics;

import jamc.util.vector;

interface IGraphicsMgr
{
    void beginFrame();
    void finishFrame();
    
    @property vec2i screenSize();
}


