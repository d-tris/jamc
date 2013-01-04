//========================================================================
// GLFW - An OpenGL framework
// API version: 2.7
// WWW:         http://www.glfw.org/
//------------------------------------------------------------------------
// Copyright (c) 2002-2006 Marcus Geelnard
// Copyright (c) 2006-2010 Camilla Berglund <elmindreda@elmindreda.org>
//
// This software is provided 'as-is', without any express or implied
// warranty. In no event will the authors be held liable for any damages
// arising from the use of this software.
//
// Permission is granted to anyone to use this software for any purpose,
// including commercial applications, and to alter it and redistribute it
// freely, subject to the following restrictions:
//
// 1. The origin of this software must not be misrepresented; you must not
//    claim that you wrote the original software. If you use this software
//    in a product, an acknowledgment in the product documentation would
//    be appreciated but is not required.
//
// 2. Altered source versions must be plainly marked as such, and must not
//    be misrepresented as being the original software.
//
// 3. This notice may not be removed or altered from any source
//    distribution.
//
//========================================================================

module GL.glfw;

public import GL.gl, GL.glu;


extern(System):


//========================================================================
// GLFW version
//========================================================================

enum int GLFW_VERSION_MAJOR      = 2;
enum int GLFW_VERSION_MINOR      = 7;
enum int GLFW_VERSION_REVISION   = 7;


//========================================================================
// Input handling definitions
//========================================================================

// Key and button state/action definitions
enum int GLFW_RELEASE           = 0;
enum int GLFW_PRESS             = 1;

// Keyboard key definitions: 8-bit ISO-8859-1 (Latin 1) encoding is used
// for printable keys (such as A-Z, 0-9 etc), and values above 256
// represent special (non-printable) keys (e.g. F1, Page Up etc).
enum int GLFW_KEY_UNKNOWN     = -1;
enum int GLFW_KEY_SPACE       = 32;
enum int GLFW_KEY_SPECIAL     = 256;
enum int GLFW_KEY_ESC         = (GLFW_KEY_SPECIAL+1);
enum int GLFW_KEY_F1          = (GLFW_KEY_SPECIAL+2);
enum int GLFW_KEY_F2          = (GLFW_KEY_SPECIAL+3);
enum int GLFW_KEY_F3          = (GLFW_KEY_SPECIAL+4);
enum int GLFW_KEY_F4          = (GLFW_KEY_SPECIAL+5);
enum int GLFW_KEY_F5          = (GLFW_KEY_SPECIAL+6);
enum int GLFW_KEY_F6          = (GLFW_KEY_SPECIAL+7);
enum int GLFW_KEY_F7          = (GLFW_KEY_SPECIAL+8);
enum int GLFW_KEY_F8          = (GLFW_KEY_SPECIAL+9);
enum int GLFW_KEY_F9          = (GLFW_KEY_SPECIAL+10);
enum int GLFW_KEY_F10         = (GLFW_KEY_SPECIAL+11);
enum int GLFW_KEY_F11         = (GLFW_KEY_SPECIAL+12);
enum int GLFW_KEY_F12         = (GLFW_KEY_SPECIAL+13);
enum int GLFW_KEY_F13         = (GLFW_KEY_SPECIAL+14);
enum int GLFW_KEY_F14         = (GLFW_KEY_SPECIAL+15);
enum int GLFW_KEY_F15         = (GLFW_KEY_SPECIAL+16);
enum int GLFW_KEY_F16         = (GLFW_KEY_SPECIAL+17);
enum int GLFW_KEY_F17         = (GLFW_KEY_SPECIAL+18);
enum int GLFW_KEY_F18         = (GLFW_KEY_SPECIAL+19);
enum int GLFW_KEY_F19         = (GLFW_KEY_SPECIAL+20);
enum int GLFW_KEY_F20         = (GLFW_KEY_SPECIAL+21);
enum int GLFW_KEY_F21         = (GLFW_KEY_SPECIAL+22);
enum int GLFW_KEY_F22         = (GLFW_KEY_SPECIAL+23);
enum int GLFW_KEY_F23         = (GLFW_KEY_SPECIAL+24);
enum int GLFW_KEY_F24         = (GLFW_KEY_SPECIAL+25);
enum int GLFW_KEY_F25         = (GLFW_KEY_SPECIAL+26);
enum int GLFW_KEY_UP          = (GLFW_KEY_SPECIAL+27);
enum int GLFW_KEY_DOWN        = (GLFW_KEY_SPECIAL+28);
enum int GLFW_KEY_LEFT        = (GLFW_KEY_SPECIAL+29);
enum int GLFW_KEY_RIGHT       = (GLFW_KEY_SPECIAL+30);
enum int GLFW_KEY_LSHIFT      = (GLFW_KEY_SPECIAL+31);
enum int GLFW_KEY_RSHIFT      = (GLFW_KEY_SPECIAL+32);
enum int GLFW_KEY_LCTRL       = (GLFW_KEY_SPECIAL+33);
enum int GLFW_KEY_RCTRL       = (GLFW_KEY_SPECIAL+34);
enum int GLFW_KEY_LALT        = (GLFW_KEY_SPECIAL+35);
enum int GLFW_KEY_RALT        = (GLFW_KEY_SPECIAL+36);
enum int GLFW_KEY_TAB         = (GLFW_KEY_SPECIAL+37);
enum int GLFW_KEY_ENTER       = (GLFW_KEY_SPECIAL+38);
enum int GLFW_KEY_BACKSPACE   = (GLFW_KEY_SPECIAL+39);
enum int GLFW_KEY_INSERT      = (GLFW_KEY_SPECIAL+40);
enum int GLFW_KEY_DEL         = (GLFW_KEY_SPECIAL+41);
enum int GLFW_KEY_PAGEUP      = (GLFW_KEY_SPECIAL+42);
enum int GLFW_KEY_PAGEDOWN    = (GLFW_KEY_SPECIAL+43);
enum int GLFW_KEY_HOME        = (GLFW_KEY_SPECIAL+44);
enum int GLFW_KEY_END         = (GLFW_KEY_SPECIAL+45);
enum int GLFW_KEY_KP_0        = (GLFW_KEY_SPECIAL+46);
enum int GLFW_KEY_KP_1        = (GLFW_KEY_SPECIAL+47);
enum int GLFW_KEY_KP_2        = (GLFW_KEY_SPECIAL+48);
enum int GLFW_KEY_KP_3        = (GLFW_KEY_SPECIAL+49);
enum int GLFW_KEY_KP_4        = (GLFW_KEY_SPECIAL+50);
enum int GLFW_KEY_KP_5        = (GLFW_KEY_SPECIAL+51);
enum int GLFW_KEY_KP_6        = (GLFW_KEY_SPECIAL+52);
enum int GLFW_KEY_KP_7        = (GLFW_KEY_SPECIAL+53);
enum int GLFW_KEY_KP_8        = (GLFW_KEY_SPECIAL+54);
enum int GLFW_KEY_KP_9        = (GLFW_KEY_SPECIAL+55);
enum int GLFW_KEY_KP_DIVIDE   = (GLFW_KEY_SPECIAL+56);
enum int GLFW_KEY_KP_MULTIPLY = (GLFW_KEY_SPECIAL+57);
enum int GLFW_KEY_KP_SUBTRACT = (GLFW_KEY_SPECIAL+58);
enum int GLFW_KEY_KP_ADD      = (GLFW_KEY_SPECIAL+59);
enum int GLFW_KEY_KP_DECIMAL  = (GLFW_KEY_SPECIAL+60);
enum int GLFW_KEY_KP_EQUAL    = (GLFW_KEY_SPECIAL+61);
enum int GLFW_KEY_KP_ENTER    = (GLFW_KEY_SPECIAL+62);
enum int GLFW_KEY_KP_NUM_LOCK = (GLFW_KEY_SPECIAL+63);
enum int GLFW_KEY_CAPS_LOCK   = (GLFW_KEY_SPECIAL+64);
enum int GLFW_KEY_SCROLL_LOCK = (GLFW_KEY_SPECIAL+65);
enum int GLFW_KEY_PAUSE       = (GLFW_KEY_SPECIAL+66);
enum int GLFW_KEY_LSUPER      = (GLFW_KEY_SPECIAL+67);
enum int GLFW_KEY_RSUPER      = (GLFW_KEY_SPECIAL+68);
enum int GLFW_KEY_MENU        = (GLFW_KEY_SPECIAL+69);
enum int GLFW_KEY_LAST        = GLFW_KEY_MENU;

// Mouse button definitions
enum int GLFW_MOUSE_BUTTON_1      = 0;
enum int GLFW_MOUSE_BUTTON_2      = 1;
enum int GLFW_MOUSE_BUTTON_3      = 2;
enum int GLFW_MOUSE_BUTTON_4      = 3;
enum int GLFW_MOUSE_BUTTON_5      = 4;
enum int GLFW_MOUSE_BUTTON_6      = 5;
enum int GLFW_MOUSE_BUTTON_7      = 6;
enum int GLFW_MOUSE_BUTTON_8      = 7;
enum int GLFW_MOUSE_BUTTON_LAST   = GLFW_MOUSE_BUTTON_8;

// Mouse button aliases
enum int GLFW_MOUSE_BUTTON_LEFT   = GLFW_MOUSE_BUTTON_1;
enum int GLFW_MOUSE_BUTTON_RIGHT  = GLFW_MOUSE_BUTTON_2;
enum int GLFW_MOUSE_BUTTON_MIDDLE = GLFW_MOUSE_BUTTON_3;

// Joystick identifiers
enum int GLFW_JOYSTICK_1         = 0;
enum int GLFW_JOYSTICK_2         = 1;
enum int GLFW_JOYSTICK_3         = 2;
enum int GLFW_JOYSTICK_4         = 3;
enum int GLFW_JOYSTICK_5         = 4;
enum int GLFW_JOYSTICK_6         = 5;
enum int GLFW_JOYSTICK_7         = 6;
enum int GLFW_JOYSTICK_8         = 7;
enum int GLFW_JOYSTICK_9         = 8;
enum int GLFW_JOYSTICK_10        = 9;
enum int GLFW_JOYSTICK_11        = 10;
enum int GLFW_JOYSTICK_12        = 11;
enum int GLFW_JOYSTICK_13        = 12;
enum int GLFW_JOYSTICK_14        = 13;
enum int GLFW_JOYSTICK_15        = 14;
enum int GLFW_JOYSTICK_16        = 15;
enum int GLFW_JOYSTICK_LAST      = GLFW_JOYSTICK_16;


//========================================================================
// Other definitions
//========================================================================

// glfwOpenWindow modes
enum int GLFW_WINDOW               = 0x00010001;
enum int GLFW_FULLSCREEN           = 0x00010002;

// glfwGetWindowParam tokens
enum int GLFW_OPENED               = 0x00020001;
enum int GLFW_ACTIVE               = 0x00020002;
enum int GLFW_ICONIFIED            = 0x00020003;
enum int GLFW_ACCELERATED          = 0x00020004;
enum int GLFW_RED_BITS             = 0x00020005;
enum int GLFW_GREEN_BITS           = 0x00020006;
enum int GLFW_BLUE_BITS            = 0x00020007;
enum int GLFW_ALPHA_BITS           = 0x00020008;
enum int GLFW_DEPTH_BITS           = 0x00020009;
enum int GLFW_STENCIL_BITS         = 0x0002000A;

// The following constants are used for both glfwGetWindowParam
// and glfwOpenWindowHint
enum int GLFW_REFRESH_RATE         = 0x0002000B;
enum int GLFW_ACCUM_RED_BITS       = 0x0002000C;
enum int GLFW_ACCUM_GREEN_BITS     = 0x0002000D;
enum int GLFW_ACCUM_BLUE_BITS      = 0x0002000E;
enum int GLFW_ACCUM_ALPHA_BITS     = 0x0002000F;
enum int GLFW_AUX_BUFFERS          = 0x00020010;
enum int GLFW_STEREO               = 0x00020011;
enum int GLFW_WINDOW_NO_RESIZE     = 0x00020012;
enum int GLFW_FSAA_SAMPLES         = 0x00020013;
enum int GLFW_OPENGL_VERSION_MAJOR = 0x00020014;
enum int GLFW_OPENGL_VERSION_MINOR = 0x00020015;
enum int GLFW_OPENGL_FORWARD_COMPAT = 0x00020016;
enum int GLFW_OPENGL_DEBUG_CONTEXT = 0x00020017;
enum int GLFW_OPENGL_PROFILE       = 0x00020018;

// GLFW_OPENGL_PROFILE tokens
enum int GLFW_OPENGL_CORE_PROFILE  = 0x00050001;
enum int GLFW_OPENGL_COMPAT_PROFILE = 0x00050002;

// glfwEnable/glfwDisable tokens
enum int GLFW_MOUSE_CURSOR         = 0x00030001;
enum int GLFW_STICKY_KEYS          = 0x00030002;
enum int GLFW_STICKY_MOUSE_BUTTONS = 0x00030003;
enum int GLFW_SYSTEM_KEYS          = 0x00030004;
enum int GLFW_KEY_REPEAT           = 0x00030005;
enum int GLFW_AUTO_POLL_EVENTS     = 0x00030006;

// glfwWaitThread wait modes
enum int GLFW_WAIT                 = 0x00040001;
enum int GLFW_NOWAIT               = 0x00040002;

// glfwGetJoystickParam tokens
enum int GLFW_PRESENT              = 0x00050001;
enum int GLFW_AXES                 = 0x00050002;
enum int GLFW_BUTTONS              = 0x00050003;

// glfwReadImage/glfwLoadTexture2D flags
enum int GLFW_NO_RESCALE_BIT       = 0x00000001; // Only for glfwReadImage
enum int GLFW_ORIGIN_UL_BIT        = 0x00000002;
enum int GLFW_BUILD_MIPMAPS_BIT    = 0x00000004; // Only for glfwLoadTexture2D
enum int GLFW_ALPHA_MAP_BIT        = 0x00000008;

// Time spans longer than this (seconds) are considered to be infinity
enum double GLFW_INFINITY          = 100000.0;


//========================================================================
// Typedefs
//========================================================================

// The video mode structure used by glfwGetVideoModes()
struct GLFWvidmode
{
    int Width, Height;
    int RedBits, BlueBits, GreenBits;
}

// Image/texture information
struct GLFWimage
{
    int Width, Height;
    int Format;
    int BytesPerPixel;
    char *Data;
}

// Thread ID
alias int GLFWthread;

// Mutex object
alias void* GLFWmutex;

// Condition variable object
alias void* GLFWcond;

// Function pointer types
alias GLFWwindowsizefun = void function(int, int);
alias GLFWwindowclosefun = int function();
alias GLFWwindowrefreshfun = void function();
alias GLFWmousebuttonfun = void function(int, int) ;
alias GLFWmouseposfun = void function(int, int);
alias GLFWmousewheelfun = void function(int);
alias GLFWkeyfun = void function(int, int);
alias GLFWcharfun = void function(int, int);
alias GLFWthreadfun = void function(void *);


//========================================================================
// Prototypes
//========================================================================

// GLFW initialization, termination and version querying
int   glfwInit();
void  glfwTerminate();
void  glfwGetVersion( int *major, int *minor, int *rev );

// Window handling
int   glfwOpenWindow( int width, int height, int redbits, int greenbits, int bluebits, int alphabits, int depthbits, int stencilbits, int mode );
void  glfwOpenWindowHint( int target, int hint );
void  glfwCloseWindow();
void  glfwSetWindowTitle( char *title );
void  glfwGetWindowSize( int *width, int *height );
void  glfwSetWindowSize( int width, int height );
void  glfwSetWindowPos( int x, int y );
void  glfwIconifyWindow();
void  glfwRestoreWindow();
void  glfwSwapBuffers();
void  glfwSwapInterval( int interval );
int   glfwGetWindowParam( int param );
void  glfwSetWindowSizeCallback( GLFWwindowsizefun cbfun );
void  glfwSetWindowCloseCallback( GLFWwindowclosefun cbfun );
void  glfwSetWindowRefreshCallback( GLFWwindowrefreshfun cbfun );

// Video mode functions
int   glfwGetVideoModes( GLFWvidmode *list, int maxcount );
void  glfwGetDesktopMode( GLFWvidmode *mode );

// Input handling
void  glfwPollEvents();
void  glfwWaitEvents();
int   glfwGetKey( int key );
int   glfwGetMouseButton( int button );
void  glfwGetMousePos( int *xpos, int *ypos );
void  glfwSetMousePos( int xpos, int ypos );
int   glfwGetMouseWheel();
void  glfwSetMouseWheel( int pos );
void  glfwSetKeyCallback( GLFWkeyfun cbfun );
void  glfwSetCharCallback( GLFWcharfun cbfun );
void  glfwSetMouseButtonCallback( GLFWmousebuttonfun cbfun );
void  glfwSetMousePosCallback( GLFWmouseposfun cbfun );
void  glfwSetMouseWheelCallback( GLFWmousewheelfun cbfun );

// Joystick input
int  glfwGetJoystickParam( int joy, int param );
int  glfwGetJoystickPos( int joy, float *pos, int numaxes );
int  glfwGetJoystickButtons( int joy, char *buttons, int numbuttons );

// Time
double  glfwGetTime();
void    glfwSetTime( double time );
void    glfwSleep( double time );

// Extension support
int    glfwExtensionSupported( char *extension );
void*  glfwGetProcAddress(  char *procname );
void   glfwGetGLVersion( int *major, int *minor, int *rev );

// Threading support
GLFWthread  glfwCreateThread( GLFWthreadfun fun, void *arg );
void  glfwDestroyThread( GLFWthread ID );
int   glfwWaitThread( GLFWthread ID, int waitmode );
GLFWthread  glfwGetThreadID();
GLFWmutex  glfwCreateMutex();
void  glfwDestroyMutex( GLFWmutex mutex );
void  glfwLockMutex( GLFWmutex mutex );
void  glfwUnlockMutex( GLFWmutex mutex );
GLFWcond  glfwCreateCond();
void  glfwDestroyCond( GLFWcond cond );
void  glfwWaitCond( GLFWcond cond, GLFWmutex mutex, double timeout );
void  glfwSignalCond( GLFWcond cond );
void  glfwBroadcastCond( GLFWcond cond );
int   glfwGetNumberOfProcessors();

// Enable/disable functions
void  glfwEnable( int token );
void  glfwDisable( int token );

// Image/texture I/O support
int   glfwReadImage( char *name, GLFWimage *img, int flags );
int   glfwReadMemoryImage( void *data, long size, GLFWimage *img, int flags );
void  glfwFreeImage( GLFWimage *img );
int   glfwLoadTexture2D( char *name, int flags );
int   glfwLoadMemoryTexture2D( void *data, long size, int flags );
int   glfwLoadTextureImage2D( GLFWimage *img, int flags );

