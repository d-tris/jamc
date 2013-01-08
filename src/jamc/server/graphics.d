module jamc.server.graphics;

import jamc.api.graphics;

class ServerGraphicsMgr : IGraphicsMgr
{
    override void beginFrame()
    {}
    
    override void finishFrame()
    {}
    
    override @property ref OGL ogl()
    {
        throw new Exception( "OpenGL rendering not enabled on JAMC server" );
    }
}
