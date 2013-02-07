#include <SFML/Graphics.h>

sfRenderWindow* createWindow(unsigned int width, unsigned int height, unsigned int bpp, 
                             const char* title, sfUint32 style, 
                             const sfContextSettings* settings)
{
    sfVideoMode mode = {width, height, bpp};
    return sfRenderWindow_create( mode, title, style, settings );
}
