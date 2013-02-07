module jamc.api.gui;

import jamc.api.widgets.BaseWidget;
import jamc.util.gpu.renderer;

interface IGui
{
    RenderProxy getNewRenderProxy( IRenderable renderable );
}
