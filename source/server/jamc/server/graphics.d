module jamc.server.graphics;

import jamc.util.vector;
import jamc.api.graphics;

class ServerGraphicsMgr : IGraphicsMgr
{
    override void beginFrame()
    {}
    
    override void finishFrame()
    {}
    
    override @property vec2i screenSize()
    {
        return vec2i( 0, 0 );
    }
}
