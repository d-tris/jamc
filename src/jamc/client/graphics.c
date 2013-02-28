#include <GL/gl.h>
#include <SFML/Graphics.h>
#include <stdint.h>

sfRenderWindow* createWindow(uint32_t width, uint32_t height, uint32_t bpp, 
                             const char* title, sfUint32 style, 
                             const sfContextSettings* settings)
{
    sfVideoMode mode = {width, height, bpp};
    return sfRenderWindow_create( mode, title, style, settings );
}

uint32_t sizeofGLenum(){ return sizeof( GLenum ); }
uint32_t sizeofGLboolean(){ return sizeof( GLboolean ); }
uint32_t sizeofGLbitfield(){ return sizeof( GLbitfield ); }
uint32_t sizeofGLsizei(){ return sizeof( GLsizei ); }
uint32_t sizeofGLbyte(){ return sizeof( GLbyte ); }
uint32_t sizeofGLshort(){ return sizeof( GLshort ); }
uint32_t sizeofGLint(){ return sizeof( GLint ); }
uint32_t sizeofGLubyte(){ return sizeof( GLubyte ); }
uint32_t sizeofGLushort(){ return sizeof( GLushort ); }
uint32_t sizeofGLuint(){ return sizeof( GLuint ); }
uint32_t sizeofGLfloat(){ return sizeof( GLfloat ); }
uint32_t sizeofGLclampf(){ return sizeof( GLclampf ); }
uint32_t sizeofGLdouble(){ return sizeof( GLdouble ); }
uint32_t sizeofGLclampd(){ return sizeof( GLclampd ); }
