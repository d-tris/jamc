module jamc.api.gui;

import jamc.api.renderer;
import jamc.api.widgets.BaseWidget;
import jamc.util.gpu.renderer;

interface IGui
{
    IRenderProxy getNewRenderProxy( IRenderable renderable );
}
