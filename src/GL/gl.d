/************************************************************************
 *
 * OpenGL 1.0 - 1.4 module for the D programming language
 * (http://www.digitalmars.com/d/)
 *
 * Conversion by Marcus Geelnard
 *
 * Originally based on gl.h from the Mesa 4.0 distribution by Brian Paul,
 * and glext.h from the SGI Open Source Sample Implementation.
 *
 * This file contains constants for OpenGL 1.0 - 1.4, aswell as for over
 * 200 different OpenGL extensions. Function declarations exist for
 * OpenGL 1.0 - 1.1, and function pointer type definitions exist for
 * OpenGL 1.2 - 1.4 and all the OpenGL extensions.
 *
 ************************************************************************/

module GL.gl;

version (Win32) {
    extern (Windows):
}
version (linux) {
    extern (C):
}



/************************************************************************
 *
 * OpenGL versions supported by this module (1.0 is assumed, and requires
 * no further introduction)
 *
 ************************************************************************/

enum uint GL_VERSION_1_1 = 1;
enum uint GL_VERSION_1_2 = 1;
enum uint GL_VERSION_1_3 = 1;
enum uint GL_VERSION_1_4 = 1;



/************************************************************************
 *
 * Datatypes
 *
 ************************************************************************/

alias uint   GLenum;
alias ubyte  GLboolean;
alias uint   GLbitfield;
alias void   GLvoid;
alias byte   GLbyte;         /* 1-byte signed */
alias short  GLshort;        /* 2-byte signed */
alias int    GLint;          /* 4-byte signed */
alias ubyte  GLubyte;        /* 1-byte unsigned */
alias ushort GLushort;       /* 2-byte unsigned */
alias uint   GLuint;         /* 4-byte unsigned */
alias int    GLsizei;        /* 4-byte signed */
alias float  GLfloat;        /* single precision float */
alias float  GLclampf;       /* single precision float in [0,1] */
alias double GLdouble;       /* double precision float */
alias double GLclampd;       /* double precision float in [0,1] */



/************************************************************************
 *
 * Constants
 *
 ************************************************************************/

/* Boolean values */
enum uint GL_FALSE                               = 0x0;
enum uint GL_TRUE                                = 0x1;

/* Data types */
enum uint GL_BYTE                                = 0x1400;
enum uint GL_UNSIGNED_BYTE                       = 0x1401;
enum uint GL_SHORT                               = 0x1402;
enum uint GL_UNSIGNED_SHORT                      = 0x1403;
enum uint GL_INT                                 = 0x1404;
enum uint GL_UNSIGNED_INT                        = 0x1405;
enum uint GL_FLOAT                               = 0x1406;
enum uint GL_DOUBLE                              = 0x140A;
enum uint GL_2_BYTES                             = 0x1407;
enum uint GL_3_BYTES                             = 0x1408;
enum uint GL_4_BYTES                             = 0x1409;

/* Primitives */
enum uint GL_POINTS                              = 0x0000;
enum uint GL_LINES                               = 0x0001;
enum uint GL_LINE_LOOP                           = 0x0002;
enum uint GL_LINE_STRIP                          = 0x0003;
enum uint GL_TRIANGLES                           = 0x0004;
enum uint GL_TRIANGLE_STRIP                      = 0x0005;
enum uint GL_TRIANGLE_FAN                        = 0x0006;
enum uint GL_QUADS                               = 0x0007;
enum uint GL_QUAD_STRIP                          = 0x0008;
enum uint GL_POLYGON                             = 0x0009;

/* Vertex Arrays */
enum uint GL_VERTEX_ARRAY                        = 0x8074;
enum uint GL_NORMAL_ARRAY                        = 0x8075;
enum uint GL_COLOR_ARRAY                         = 0x8076;
enum uint GL_INDEX_ARRAY                         = 0x8077;
enum uint GL_TEXTURE_COORD_ARRAY                 = 0x8078;
enum uint GL_EDGE_FLAG_ARRAY                     = 0x8079;
enum uint GL_VERTEX_ARRAY_SIZE                   = 0x807A;
enum uint GL_VERTEX_ARRAY_TYPE                   = 0x807B;
enum uint GL_VERTEX_ARRAY_STRIDE                 = 0x807C;
enum uint GL_NORMAL_ARRAY_TYPE                   = 0x807E;
enum uint GL_NORMAL_ARRAY_STRIDE                 = 0x807F;
enum uint GL_COLOR_ARRAY_SIZE                    = 0x8081;
enum uint GL_COLOR_ARRAY_TYPE                    = 0x8082;
enum uint GL_COLOR_ARRAY_STRIDE                  = 0x8083;
enum uint GL_INDEX_ARRAY_TYPE                    = 0x8085;
enum uint GL_INDEX_ARRAY_STRIDE                  = 0x8086;
enum uint GL_TEXTURE_COORD_ARRAY_SIZE            = 0x8088;
enum uint GL_TEXTURE_COORD_ARRAY_TYPE            = 0x8089;
enum uint GL_TEXTURE_COORD_ARRAY_STRIDE          = 0x808A;
enum uint GL_EDGE_FLAG_ARRAY_STRIDE              = 0x808C;
enum uint GL_VERTEX_ARRAY_POINTER                = 0x808E;
enum uint GL_NORMAL_ARRAY_POINTER                = 0x808F;
enum uint GL_COLOR_ARRAY_POINTER                 = 0x8090;
enum uint GL_INDEX_ARRAY_POINTER                 = 0x8091;
enum uint GL_TEXTURE_COORD_ARRAY_POINTER         = 0x8092;
enum uint GL_EDGE_FLAG_ARRAY_POINTER             = 0x8093;
enum uint GL_V2F                                 = 0x2A20;
enum uint GL_V3F                                 = 0x2A21;
enum uint GL_C4UB_V2F                            = 0x2A22;
enum uint GL_C4UB_V3F                            = 0x2A23;
enum uint GL_C3F_V3F                             = 0x2A24;
enum uint GL_N3F_V3F                             = 0x2A25;
enum uint GL_C4F_N3F_V3F                         = 0x2A26;
enum uint GL_T2F_V3F                             = 0x2A27;
enum uint GL_T4F_V4F                             = 0x2A28;
enum uint GL_T2F_C4UB_V3F                        = 0x2A29;
enum uint GL_T2F_C3F_V3F                         = 0x2A2A;
enum uint GL_T2F_N3F_V3F                         = 0x2A2B;
enum uint GL_T2F_C4F_N3F_V3F                     = 0x2A2C;
enum uint GL_T4F_C4F_N3F_V4F                     = 0x2A2D;

/* Matrix Mode */
enum uint GL_MATRIX_MODE                         = 0x0BA0;
enum uint GL_MODELVIEW                           = 0x1700;
enum uint GL_PROJECTION                          = 0x1701;
enum uint GL_TEXTURE                             = 0x1702;

/* Points */
enum uint GL_POINT_SMOOTH                        = 0x0B10;
enum uint GL_POINT_SIZE                          = 0x0B11;
enum uint GL_POINT_SIZE_GRANULARITY              = 0x0B13;
enum uint GL_POINT_SIZE_RANGE                    = 0x0B12;

/* Lines */
enum uint GL_LINE_SMOOTH                         = 0x0B20;
enum uint GL_LINE_STIPPLE                        = 0x0B24;
enum uint GL_LINE_STIPPLE_PATTERN                = 0x0B25;
enum uint GL_LINE_STIPPLE_REPEAT                 = 0x0B26;
enum uint GL_LINE_WIDTH                          = 0x0B21;
enum uint GL_LINE_WIDTH_GRANULARITY              = 0x0B23;
enum uint GL_LINE_WIDTH_RANGE                    = 0x0B22;

/* Polygons */
enum uint GL_POINT                               = 0x1B00;
enum uint GL_LINE                                = 0x1B01;
enum uint GL_FILL                                = 0x1B02;
enum uint GL_CW                                  = 0x0900;
enum uint GL_CCW                                 = 0x0901;
enum uint GL_FRONT                               = 0x0404;
enum uint GL_BACK                                = 0x0405;
enum uint GL_POLYGON_MODE                        = 0x0B40;
enum uint GL_POLYGON_SMOOTH                      = 0x0B41;
enum uint GL_POLYGON_STIPPLE                     = 0x0B42;
enum uint GL_EDGE_FLAG                           = 0x0B43;
enum uint GL_CULL_FACE                           = 0x0B44;
enum uint GL_CULL_FACE_MODE                      = 0x0B45;
enum uint GL_FRONT_FACE                          = 0x0B46;
enum uint GL_POLYGON_OFFSET_FACTOR               = 0x8038;
enum uint GL_POLYGON_OFFSET_UNITS                = 0x2A00;
enum uint GL_POLYGON_OFFSET_POINT                = 0x2A01;
enum uint GL_POLYGON_OFFSET_LINE                 = 0x2A02;
enum uint GL_POLYGON_OFFSET_FILL                 = 0x8037;

/* Display Lists */
enum uint GL_COMPILE                             = 0x1300;
enum uint GL_COMPILE_AND_EXECUTE                 = 0x1301;
enum uint GL_LIST_BASE                           = 0x0B32;
enum uint GL_LIST_INDEX                          = 0x0B33;
enum uint GL_LIST_MODE                           = 0x0B30;

/* Depth buffer */
enum uint GL_NEVER                               = 0x0200;
enum uint GL_LESS                                = 0x0201;
enum uint GL_EQUAL                               = 0x0202;
enum uint GL_LEQUAL                              = 0x0203;
enum uint GL_GREATER                             = 0x0204;
enum uint GL_NOTEQUAL                            = 0x0205;
enum uint GL_GEQUAL                              = 0x0206;
enum uint GL_ALWAYS                              = 0x0207;
enum uint GL_DEPTH_TEST                          = 0x0B71;
enum uint GL_DEPTH_BITS                          = 0x0D56;
enum uint GL_DEPTH_CLEAR_VALUE                   = 0x0B73;
enum uint GL_DEPTH_FUNC                          = 0x0B74;
enum uint GL_DEPTH_RANGE                         = 0x0B70;
enum uint GL_DEPTH_WRITEMASK                     = 0x0B72;
enum uint GL_DEPTH_COMPONENT                     = 0x1902;

/* Lighting */
enum uint GL_LIGHTING                            = 0x0B50;
enum uint GL_LIGHT0                              = 0x4000;
enum uint GL_LIGHT1                              = 0x4001;
enum uint GL_LIGHT2                              = 0x4002;
enum uint GL_LIGHT3                              = 0x4003;
enum uint GL_LIGHT4                              = 0x4004;
enum uint GL_LIGHT5                              = 0x4005;
enum uint GL_LIGHT6                              = 0x4006;
enum uint GL_LIGHT7                              = 0x4007;
enum uint GL_SPOT_EXPONENT                       = 0x1205;
enum uint GL_SPOT_CUTOFF                         = 0x1206;
enum uint GL_CONSTANT_ATTENUATION                = 0x1207;
enum uint GL_LINEAR_ATTENUATION                  = 0x1208;
enum uint GL_QUADRATIC_ATTENUATION               = 0x1209;
enum uint GL_AMBIENT                             = 0x1200;
enum uint GL_DIFFUSE                             = 0x1201;
enum uint GL_SPECULAR                            = 0x1202;
enum uint GL_SHININESS                           = 0x1601;
enum uint GL_EMISSION                            = 0x1600;
enum uint GL_POSITION                            = 0x1203;
enum uint GL_SPOT_DIRECTION                      = 0x1204;
enum uint GL_AMBIENT_AND_DIFFUSE                 = 0x1602;
enum uint GL_COLOR_INDEXES                       = 0x1603;
enum uint GL_LIGHT_MODEL_TWO_SIDE                = 0x0B52;
enum uint GL_LIGHT_MODEL_LOCAL_VIEWER            = 0x0B51;
enum uint GL_LIGHT_MODEL_AMBIENT                 = 0x0B53;
enum uint GL_FRONT_AND_BACK                      = 0x0408;
enum uint GL_SHADE_MODEL                         = 0x0B54;
enum uint GL_FLAT                                = 0x1D00;
enum uint GL_SMOOTH                              = 0x1D01;
enum uint GL_COLOR_MATERIAL                      = 0x0B57;
enum uint GL_COLOR_MATERIAL_FACE                 = 0x0B55;
enum uint GL_COLOR_MATERIAL_PARAMETER            = 0x0B56;
enum uint GL_NORMALIZE                           = 0x0BA1;

/* User clipping planes */
enum uint GL_CLIP_PLANE0                         = 0x3000;
enum uint GL_CLIP_PLANE1                         = 0x3001;
enum uint GL_CLIP_PLANE2                         = 0x3002;
enum uint GL_CLIP_PLANE3                         = 0x3003;
enum uint GL_CLIP_PLANE4                         = 0x3004;
enum uint GL_CLIP_PLANE5                         = 0x3005;

/* Accumulation buffer */
enum uint GL_ACCUM_RED_BITS                      = 0x0D58;
enum uint GL_ACCUM_GREEN_BITS                    = 0x0D59;
enum uint GL_ACCUM_BLUE_BITS                     = 0x0D5A;
enum uint GL_ACCUM_ALPHA_BITS                    = 0x0D5B;
enum uint GL_ACCUM_CLEAR_VALUE                   = 0x0B80;
enum uint GL_ACCUM                               = 0x0100;
enum uint GL_ADD                                 = 0x0104;
enum uint GL_LOAD                                = 0x0101;
enum uint GL_MULT                                = 0x0103;
enum uint GL_RETURN                              = 0x0102;

/* Alpha testing */
enum uint GL_ALPHA_TEST                          = 0x0BC0;
enum uint GL_ALPHA_TEST_REF                      = 0x0BC2;
enum uint GL_ALPHA_TEST_FUNC                     = 0x0BC1;

/* Blending */
enum uint GL_BLEND                               = 0x0BE2;
enum uint GL_BLEND_SRC                           = 0x0BE1;
enum uint GL_BLEND_DST                           = 0x0BE0;
enum uint GL_ZERO                                = 0x0;
enum uint GL_ONE                                 = 0x1;
enum uint GL_SRC_COLOR                           = 0x0300;
enum uint GL_ONE_MINUS_SRC_COLOR                 = 0x0301;
enum uint GL_SRC_ALPHA                           = 0x0302;
enum uint GL_ONE_MINUS_SRC_ALPHA                 = 0x0303;
enum uint GL_DST_ALPHA                           = 0x0304;
enum uint GL_ONE_MINUS_DST_ALPHA                 = 0x0305;
enum uint GL_DST_COLOR                           = 0x0306;
enum uint GL_ONE_MINUS_DST_COLOR                 = 0x0307;
enum uint GL_SRC_ALPHA_SATURATE                  = 0x0308;
/*
enum uint GL_CONSTANT_COLOR                      = 0x8001;
enum uint GL_ONE_MINUS_CONSTANT_COLOR            = 0x8002;
enum uint GL_CONSTANT_ALPHA                      = 0x8003;
enum uint GL_ONE_MINUS_CONSTANT_ALPHA            = 0x8004;
*/

/* Render Mode */
enum uint GL_FEEDBACK                            = 0x1C01;
enum uint GL_RENDER                              = 0x1C00;
enum uint GL_SELECT                              = 0x1C02;

/* Feedback */
enum uint GL_2D                                  = 0x0600;
enum uint GL_3D                                  = 0x0601;
enum uint GL_3D_COLOR                            = 0x0602;
enum uint GL_3D_COLOR_TEXTURE                    = 0x0603;
enum uint GL_4D_COLOR_TEXTURE                    = 0x0604;
enum uint GL_POINT_TOKEN                         = 0x0701;
enum uint GL_LINE_TOKEN                          = 0x0702;
enum uint GL_LINE_RESET_TOKEN                    = 0x0707;
enum uint GL_POLYGON_TOKEN                       = 0x0703;
enum uint GL_BITMAP_TOKEN                        = 0x0704;
enum uint GL_DRAW_PIXEL_TOKEN                    = 0x0705;
enum uint GL_COPY_PIXEL_TOKEN                    = 0x0706;
enum uint GL_PASS_THROUGH_TOKEN                  = 0x0700;
enum uint GL_FEEDBACK_BUFFER_POINTER             = 0x0DF0;
enum uint GL_FEEDBACK_BUFFER_SIZE                = 0x0DF1;
enum uint GL_FEEDBACK_BUFFER_TYPE                = 0x0DF2;

/* Selection */
enum uint GL_SELECTION_BUFFER_POINTER            = 0x0DF3;
enum uint GL_SELECTION_BUFFER_SIZE               = 0x0DF4;

/* Fog */
enum uint GL_FOG                                 = 0x0B60;
enum uint GL_FOG_MODE                            = 0x0B65;
enum uint GL_FOG_DENSITY                         = 0x0B62;
enum uint GL_FOG_COLOR                           = 0x0B66;
enum uint GL_FOG_INDEX                           = 0x0B61;
enum uint GL_FOG_START                           = 0x0B63;
enum uint GL_FOG_END                             = 0x0B64;
enum uint GL_LINEAR                              = 0x2601;
enum uint GL_EXP                                 = 0x0800;
enum uint GL_EXP2                                = 0x0801;

/* Logic Ops */
enum uint GL_LOGIC_OP                            = 0x0BF1;
enum uint GL_INDEX_LOGIC_OP                      = 0x0BF1;
enum uint GL_COLOR_LOGIC_OP                      = 0x0BF2;
enum uint GL_LOGIC_OP_MODE                       = 0x0BF0;
enum uint GL_CLEAR                               = 0x1500;
enum uint GL_SET                                 = 0x150F;
enum uint GL_COPY                                = 0x1503;
enum uint GL_COPY_INVERTED                       = 0x150C;
enum uint GL_NOOP                                = 0x1505;
enum uint GL_INVERT                              = 0x150A;
enum uint GL_AND                                 = 0x1501;
enum uint GL_NAND                                = 0x150E;
enum uint GL_OR                                  = 0x1507;
enum uint GL_NOR                                 = 0x1508;
enum uint GL_XOR                                 = 0x1506;
enum uint GL_EQUIV                               = 0x1509;
enum uint GL_AND_REVERSE                         = 0x1502;
enum uint GL_AND_INVERTED                        = 0x1504;
enum uint GL_OR_REVERSE                          = 0x150B;
enum uint GL_OR_INVERTED                         = 0x150D;

/* Stencil */
enum uint GL_STENCIL_TEST                        = 0x0B90;
enum uint GL_STENCIL_WRITEMASK                   = 0x0B98;
enum uint GL_STENCIL_BITS                        = 0x0D57;
enum uint GL_STENCIL_FUNC                        = 0x0B92;
enum uint GL_STENCIL_VALUE_MASK                  = 0x0B93;
enum uint GL_STENCIL_REF                         = 0x0B97;
enum uint GL_STENCIL_FAIL                        = 0x0B94;
enum uint GL_STENCIL_PASS_DEPTH_PASS             = 0x0B96;
enum uint GL_STENCIL_PASS_DEPTH_FAIL             = 0x0B95;
enum uint GL_STENCIL_CLEAR_VALUE                 = 0x0B91;
enum uint GL_STENCIL_INDEX                       = 0x1901;
enum uint GL_KEEP                                = 0x1E00;
enum uint GL_REPLACE                             = 0x1E01;
enum uint GL_INCR                                = 0x1E02;
enum uint GL_DECR                                = 0x1E03;

/* Buffers, Pixel Drawing/Reading */
enum uint GL_NONE                                = 0x0;
enum uint GL_LEFT                                = 0x0406;
enum uint GL_RIGHT                               = 0x0407;
/* GL_FRONT                                       = 0x0404; */
/* GL_BACK                                        = 0x0405; */
/* GL_FRONT_AND_BACK                              = 0x0408; */
enum uint GL_FRONT_LEFT                          = 0x0400;
enum uint GL_FRONT_RIGHT                         = 0x0401;
enum uint GL_BACK_LEFT                           = 0x0402;
enum uint GL_BACK_RIGHT                          = 0x0403;
enum uint GL_AUX0                                = 0x0409;
enum uint GL_AUX1                                = 0x040A;
enum uint GL_AUX2                                = 0x040B;
enum uint GL_AUX3                                = 0x040C;
enum uint GL_COLOR_INDEX                         = 0x1900;
enum uint GL_RED                                 = 0x1903;
enum uint GL_GREEN                               = 0x1904;
enum uint GL_BLUE                                = 0x1905;
enum uint GL_ALPHA                               = 0x1906;
enum uint GL_LUMINANCE                           = 0x1909;
enum uint GL_LUMINANCE_ALPHA                     = 0x190A;
enum uint GL_ALPHA_BITS                          = 0x0D55;
enum uint GL_RED_BITS                            = 0x0D52;
enum uint GL_GREEN_BITS                          = 0x0D53;
enum uint GL_BLUE_BITS                           = 0x0D54;
enum uint GL_INDEX_BITS                          = 0x0D51;
enum uint GL_SUBPIXEL_BITS                       = 0x0D50;
enum uint GL_AUX_BUFFERS                         = 0x0C00;
enum uint GL_READ_BUFFER                         = 0x0C02;
enum uint GL_DRAW_BUFFER                         = 0x0C01;
enum uint GL_DOUBLEBUFFER                        = 0x0C32;
enum uint GL_STEREO                              = 0x0C33;
enum uint GL_BITMAP                              = 0x1A00;
enum uint GL_COLOR                               = 0x1800;
enum uint GL_DEPTH                               = 0x1801;
enum uint GL_STENCIL                             = 0x1802;
enum uint GL_DITHER                              = 0x0BD0;
enum uint GL_RGB                                 = 0x1907;
enum uint GL_RGBA                                = 0x1908;

/* Implementation limits */
enum uint GL_MAX_LIST_NESTING                    = 0x0B31;
enum uint GL_MAX_ATTRIB_STACK_DEPTH              = 0x0D35;
enum uint GL_MAX_MODELVIEW_STACK_DEPTH           = 0x0D36;
enum uint GL_MAX_NAME_STACK_DEPTH                = 0x0D37;
enum uint GL_MAX_PROJECTION_STACK_DEPTH          = 0x0D38;
enum uint GL_MAX_TEXTURE_STACK_DEPTH             = 0x0D39;
enum uint GL_MAX_EVAL_ORDER                      = 0x0D30;
enum uint GL_MAX_LIGHTS                          = 0x0D31;
enum uint GL_MAX_CLIP_PLANES                     = 0x0D32;
enum uint GL_MAX_TEXTURE_SIZE                    = 0x0D33;
enum uint GL_MAX_PIXEL_MAP_TABLE                 = 0x0D34;
enum uint GL_MAX_VIEWPORT_DIMS                   = 0x0D3A;
enum uint GL_MAX_CLIENT_ATTRIB_STACK_DEPTH       = 0x0D3B;

/* Gets */
enum uint GL_ATTRIB_STACK_DEPTH                  = 0x0BB0;
enum uint GL_CLIENT_ATTRIB_STACK_DEPTH           = 0x0BB1;
enum uint GL_COLOR_CLEAR_VALUE                   = 0x0C22;
enum uint GL_COLOR_WRITEMASK                     = 0x0C23;
enum uint GL_CURRENT_INDEX                       = 0x0B01;
enum uint GL_CURRENT_COLOR                       = 0x0B00;
enum uint GL_CURRENT_NORMAL                      = 0x0B02;
enum uint GL_CURRENT_RASTER_COLOR                = 0x0B04;
enum uint GL_CURRENT_RASTER_DISTANCE             = 0x0B09;
enum uint GL_CURRENT_RASTER_INDEX                = 0x0B05;
enum uint GL_CURRENT_RASTER_POSITION             = 0x0B07;
enum uint GL_CURRENT_RASTER_TEXTURE_COORDS       = 0x0B06;
enum uint GL_CURRENT_RASTER_POSITION_VALID       = 0x0B08;
enum uint GL_CURRENT_TEXTURE_COORDS              = 0x0B03;
enum uint GL_INDEX_CLEAR_VALUE                   = 0x0C20;
enum uint GL_INDEX_MODE                          = 0x0C30;
enum uint GL_INDEX_WRITEMASK                     = 0x0C21;
enum uint GL_MODELVIEW_MATRIX                    = 0x0BA6;
enum uint GL_MODELVIEW_STACK_DEPTH               = 0x0BA3;
enum uint GL_NAME_STACK_DEPTH                    = 0x0D70;
enum uint GL_PROJECTION_MATRIX                   = 0x0BA7;
enum uint GL_PROJECTION_STACK_DEPTH              = 0x0BA4;
enum uint GL_RENDER_MODE                         = 0x0C40;
enum uint GL_RGBA_MODE                           = 0x0C31;
enum uint GL_TEXTURE_MATRIX                      = 0x0BA8;
enum uint GL_TEXTURE_STACK_DEPTH                 = 0x0BA5;
enum uint GL_VIEWPORT                            = 0x0BA2;

/* Evaluators */
enum uint GL_AUTO_NORMAL                         = 0x0D80;
enum uint GL_MAP1_COLOR_4                        = 0x0D90;
enum uint GL_MAP1_GRID_DOMAIN                    = 0x0DD0;
enum uint GL_MAP1_GRID_SEGMENTS                  = 0x0DD1;
enum uint GL_MAP1_INDEX                          = 0x0D91;
enum uint GL_MAP1_NORMAL                         = 0x0D92;
enum uint GL_MAP1_TEXTURE_COORD_1                = 0x0D93;
enum uint GL_MAP1_TEXTURE_COORD_2                = 0x0D94;
enum uint GL_MAP1_TEXTURE_COORD_3                = 0x0D95;
enum uint GL_MAP1_TEXTURE_COORD_4                = 0x0D96;
enum uint GL_MAP1_VERTEX_3                       = 0x0D97;
enum uint GL_MAP1_VERTEX_4                       = 0x0D98;
enum uint GL_MAP2_COLOR_4                        = 0x0DB0;
enum uint GL_MAP2_GRID_DOMAIN                    = 0x0DD2;
enum uint GL_MAP2_GRID_SEGMENTS                  = 0x0DD3;
enum uint GL_MAP2_INDEX                          = 0x0DB1;
enum uint GL_MAP2_NORMAL                         = 0x0DB2;
enum uint GL_MAP2_TEXTURE_COORD_1                = 0x0DB3;
enum uint GL_MAP2_TEXTURE_COORD_2                = 0x0DB4;
enum uint GL_MAP2_TEXTURE_COORD_3                = 0x0DB5;
enum uint GL_MAP2_TEXTURE_COORD_4                = 0x0DB6;
enum uint GL_MAP2_VERTEX_3                       = 0x0DB7;
enum uint GL_MAP2_VERTEX_4                       = 0x0DB8;
enum uint GL_COEFF                               = 0x0A00;
enum uint GL_DOMAIN                              = 0x0A02;
enum uint GL_ORDER                               = 0x0A01;

/* Hints */
enum uint GL_FOG_HINT                            = 0x0C54;
enum uint GL_LINE_SMOOTH_HINT                    = 0x0C52;
enum uint GL_PERSPECTIVE_CORRECTION_HINT         = 0x0C50;
enum uint GL_POINT_SMOOTH_HINT                   = 0x0C51;
enum uint GL_POLYGON_SMOOTH_HINT                 = 0x0C53;
enum uint GL_DONT_CARE                           = 0x1100;
enum uint GL_FASTEST                             = 0x1101;
enum uint GL_NICEST                              = 0x1102;

/* Scissor box */
enum uint GL_SCISSOR_TEST                        = 0x0C11;
enum uint GL_SCISSOR_BOX                         = 0x0C10;

/* Pixel Mode / Transfer */
enum uint GL_MAP_COLOR                           = 0x0D10;
enum uint GL_MAP_STENCIL                         = 0x0D11;
enum uint GL_INDEX_SHIFT                         = 0x0D12;
enum uint GL_INDEX_OFFSET                        = 0x0D13;
enum uint GL_RED_SCALE                           = 0x0D14;
enum uint GL_RED_BIAS                            = 0x0D15;
enum uint GL_GREEN_SCALE                         = 0x0D18;
enum uint GL_GREEN_BIAS                          = 0x0D19;
enum uint GL_BLUE_SCALE                          = 0x0D1A;
enum uint GL_BLUE_BIAS                           = 0x0D1B;
enum uint GL_ALPHA_SCALE                         = 0x0D1C;
enum uint GL_ALPHA_BIAS                          = 0x0D1D;
enum uint GL_DEPTH_SCALE                         = 0x0D1E;
enum uint GL_DEPTH_BIAS                          = 0x0D1F;
enum uint GL_PIXEL_MAP_S_TO_S_SIZE               = 0x0CB1;
enum uint GL_PIXEL_MAP_I_TO_I_SIZE               = 0x0CB0;
enum uint GL_PIXEL_MAP_I_TO_R_SIZE               = 0x0CB2;
enum uint GL_PIXEL_MAP_I_TO_G_SIZE               = 0x0CB3;
enum uint GL_PIXEL_MAP_I_TO_B_SIZE               = 0x0CB4;
enum uint GL_PIXEL_MAP_I_TO_A_SIZE               = 0x0CB5;
enum uint GL_PIXEL_MAP_R_TO_R_SIZE               = 0x0CB6;
enum uint GL_PIXEL_MAP_G_TO_G_SIZE               = 0x0CB7;
enum uint GL_PIXEL_MAP_B_TO_B_SIZE               = 0x0CB8;
enum uint GL_PIXEL_MAP_A_TO_A_SIZE               = 0x0CB9;
enum uint GL_PIXEL_MAP_S_TO_S                    = 0x0C71;
enum uint GL_PIXEL_MAP_I_TO_I                    = 0x0C70;
enum uint GL_PIXEL_MAP_I_TO_R                    = 0x0C72;
enum uint GL_PIXEL_MAP_I_TO_G                    = 0x0C73;
enum uint GL_PIXEL_MAP_I_TO_B                    = 0x0C74;
enum uint GL_PIXEL_MAP_I_TO_A                    = 0x0C75;
enum uint GL_PIXEL_MAP_R_TO_R                    = 0x0C76;
enum uint GL_PIXEL_MAP_G_TO_G                    = 0x0C77;
enum uint GL_PIXEL_MAP_B_TO_B                    = 0x0C78;
enum uint GL_PIXEL_MAP_A_TO_A                    = 0x0C79;
enum uint GL_PACK_ALIGNMENT                      = 0x0D05;
enum uint GL_PACK_LSB_FIRST                      = 0x0D01;
enum uint GL_PACK_ROW_LENGTH                     = 0x0D02;
enum uint GL_PACK_SKIP_PIXELS                    = 0x0D04;
enum uint GL_PACK_SKIP_ROWS                      = 0x0D03;
enum uint GL_PACK_SWAP_BYTES                     = 0x0D00;
enum uint GL_UNPACK_ALIGNMENT                    = 0x0CF5;
enum uint GL_UNPACK_LSB_FIRST                    = 0x0CF1;
enum uint GL_UNPACK_ROW_LENGTH                   = 0x0CF2;
enum uint GL_UNPACK_SKIP_PIXELS                  = 0x0CF4;
enum uint GL_UNPACK_SKIP_ROWS                    = 0x0CF3;
enum uint GL_UNPACK_SWAP_BYTES                   = 0x0CF0;
enum uint GL_ZOOM_X                              = 0x0D16;
enum uint GL_ZOOM_Y                              = 0x0D17;

/* Texture mapping */
enum uint GL_TEXTURE_ENV                         = 0x2300;
enum uint GL_TEXTURE_ENV_MODE                    = 0x2200;
enum uint GL_TEXTURE_1D                          = 0x0DE0;
enum uint GL_TEXTURE_2D                          = 0x0DE1;
enum uint GL_TEXTURE_WRAP_S                      = 0x2802;
enum uint GL_TEXTURE_WRAP_T                      = 0x2803;
enum uint GL_TEXTURE_MAG_FILTER                  = 0x2800;
enum uint GL_TEXTURE_MIN_FILTER                  = 0x2801;
enum uint GL_TEXTURE_ENV_COLOR                   = 0x2201;
enum uint GL_TEXTURE_GEN_S                       = 0x0C60;
enum uint GL_TEXTURE_GEN_T                       = 0x0C61;
enum uint GL_TEXTURE_GEN_MODE                    = 0x2500;
enum uint GL_TEXTURE_BORDER_COLOR                = 0x1004;
enum uint GL_TEXTURE_WIDTH                       = 0x1000;
enum uint GL_TEXTURE_HEIGHT                      = 0x1001;
enum uint GL_TEXTURE_BORDER                      = 0x1005;
enum uint GL_TEXTURE_COMPONENTS                  = 0x1003;
enum uint GL_TEXTURE_RED_SIZE                    = 0x805C;
enum uint GL_TEXTURE_GREEN_SIZE                  = 0x805D;
enum uint GL_TEXTURE_BLUE_SIZE                   = 0x805E;
enum uint GL_TEXTURE_ALPHA_SIZE                  = 0x805F;
enum uint GL_TEXTURE_LUMINANCE_SIZE              = 0x8060;
enum uint GL_TEXTURE_INTENSITY_SIZE              = 0x8061;
enum uint GL_NEAREST_MIPMAP_NEAREST              = 0x2700;
enum uint GL_NEAREST_MIPMAP_LINEAR               = 0x2702;
enum uint GL_LINEAR_MIPMAP_NEAREST               = 0x2701;
enum uint GL_LINEAR_MIPMAP_LINEAR                = 0x2703;
enum uint GL_OBJECT_LINEAR                       = 0x2401;
enum uint GL_OBJECT_PLANE                        = 0x2501;
enum uint GL_EYE_LINEAR                          = 0x2400;
enum uint GL_EYE_PLANE                           = 0x2502;
enum uint GL_SPHERE_MAP                          = 0x2402;
enum uint GL_DECAL                               = 0x2101;
enum uint GL_MODULATE                            = 0x2100;
enum uint GL_NEAREST                             = 0x2600;
enum uint GL_REPEAT                              = 0x2901;
enum uint GL_CLAMP                               = 0x2900;
enum uint GL_S                                   = 0x2000;
enum uint GL_T                                   = 0x2001;
enum uint GL_R                                   = 0x2002;
enum uint GL_Q                                   = 0x2003;
enum uint GL_TEXTURE_GEN_R                       = 0x0C62;
enum uint GL_TEXTURE_GEN_Q                       = 0x0C63;

/* Utility */
enum uint GL_VENDOR                              = 0x1F00;
enum uint GL_RENDERER                            = 0x1F01;
enum uint GL_VERSION                             = 0x1F02;
enum uint GL_EXTENSIONS                          = 0x1F03;

/* Errors */
enum uint GL_NO_ERROR                            = 0x0;
enum uint GL_INVALID_VALUE                       = 0x0501;
enum uint GL_INVALID_ENUM                        = 0x0500;
enum uint GL_INVALID_OPERATION                   = 0x0502;
enum uint GL_STACK_OVERFLOW                      = 0x0503;
enum uint GL_STACK_UNDERFLOW                     = 0x0504;
enum uint GL_OUT_OF_MEMORY                       = 0x0505;

/* glPush/PopAttrib bits */
enum uint GL_CURRENT_BIT                         = 0x00000001;
enum uint GL_POINT_BIT                           = 0x00000002;
enum uint GL_LINE_BIT                            = 0x00000004;
enum uint GL_POLYGON_BIT                         = 0x00000008;
enum uint GL_POLYGON_STIPPLE_BIT                 = 0x00000010;
enum uint GL_PIXEL_MODE_BIT                      = 0x00000020;
enum uint GL_LIGHTING_BIT                        = 0x00000040;
enum uint GL_FOG_BIT                             = 0x00000080;
enum uint GL_DEPTH_BUFFER_BIT                    = 0x00000100;
enum uint GL_ACCUM_BUFFER_BIT                    = 0x00000200;
enum uint GL_STENCIL_BUFFER_BIT                  = 0x00000400;
enum uint GL_VIEWPORT_BIT                        = 0x00000800;
enum uint GL_TRANSFORM_BIT                       = 0x00001000;
enum uint GL_ENABLE_BIT                          = 0x00002000;
enum uint GL_COLOR_BUFFER_BIT                    = 0x00004000;
enum uint GL_HINT_BIT                            = 0x00008000;
enum uint GL_EVAL_BIT                            = 0x00010000;
enum uint GL_LIST_BIT                            = 0x00020000;
enum uint GL_TEXTURE_BIT                         = 0x00040000;
enum uint GL_SCISSOR_BIT                         = 0x00080000;
enum uint GL_ALL_ATTRIB_BITS                     = 0x000FFFFF;


/* OpenGL 1.1 */
enum uint GL_PROXY_TEXTURE_1D                    = 0x8063;
enum uint GL_PROXY_TEXTURE_2D                    = 0x8064;
enum uint GL_TEXTURE_PRIORITY                    = 0x8066;
enum uint GL_TEXTURE_RESIDENT                    = 0x8067;
enum uint GL_TEXTURE_BINDING_1D                  = 0x8068;
enum uint GL_TEXTURE_BINDING_2D                  = 0x8069;
enum uint GL_TEXTURE_INTERNAL_FORMAT             = 0x1003;
enum uint GL_ALPHA4                              = 0x803B;
enum uint GL_ALPHA8                              = 0x803C;
enum uint GL_ALPHA12                             = 0x803D;
enum uint GL_ALPHA16                             = 0x803E;
enum uint GL_LUMINANCE4                          = 0x803F;
enum uint GL_LUMINANCE8                          = 0x8040;
enum uint GL_LUMINANCE12                         = 0x8041;
enum uint GL_LUMINANCE16                         = 0x8042;
enum uint GL_LUMINANCE4_ALPHA4                   = 0x8043;
enum uint GL_LUMINANCE6_ALPHA2                   = 0x8044;
enum uint GL_LUMINANCE8_ALPHA8                   = 0x8045;
enum uint GL_LUMINANCE12_ALPHA4                  = 0x8046;
enum uint GL_LUMINANCE12_ALPHA12                 = 0x8047;
enum uint GL_LUMINANCE16_ALPHA16                 = 0x8048;
enum uint GL_INTENSITY                           = 0x8049;
enum uint GL_INTENSITY4                          = 0x804A;
enum uint GL_INTENSITY8                          = 0x804B;
enum uint GL_INTENSITY12                         = 0x804C;
enum uint GL_INTENSITY16                         = 0x804D;
enum uint GL_R3_G3_B2                            = 0x2A10;
enum uint GL_RGB4                                = 0x804F;
enum uint GL_RGB5                                = 0x8050;
enum uint GL_RGB8                                = 0x8051;
enum uint GL_RGB10                               = 0x8052;
enum uint GL_RGB12                               = 0x8053;
enum uint GL_RGB16                               = 0x8054;
enum uint GL_RGBA2                               = 0x8055;
enum uint GL_RGBA4                               = 0x8056;
enum uint GL_RGB5_A1                             = 0x8057;
enum uint GL_RGBA8                               = 0x8058;
enum uint GL_RGB10_A2                            = 0x8059;
enum uint GL_RGBA12                              = 0x805A;
enum uint GL_RGBA16                              = 0x805B;
enum uint GL_CLIENT_PIXEL_STORE_BIT              = 0x00000001;
enum uint GL_CLIENT_VERTEX_ARRAY_BIT             = 0x00000002;
enum uint GL_ALL_CLIENT_ATTRIB_BITS              = 0xFFFFFFFF;
enum uint GL_CLIENT_ALL_ATTRIB_BITS              = 0xFFFFFFFF;


/************************************************************************
 * OpenGL 1.2 -> 1.4 constants
 * Note: Proper OpenGL extension/version checking must be performed to
 * use these under Windows.
 ************************************************************************/

/* OpenGL 1.2 */
enum uint GL_RESCALE_NORMAL                      = 0x803A;
enum uint GL_CLAMP_TO_EDGE                       = 0x812F;
enum uint GL_MAX_ELEMENTS_VERTICES               = 0x80E8;
enum uint GL_MAX_ELEMENTS_INDICES                = 0x80E9;
enum uint GL_BGR                                 = 0x80E0;
enum uint GL_BGRA                                = 0x80E1;
enum uint GL_UNSIGNED_BYTE_3_3_2                 = 0x8032;
enum uint GL_UNSIGNED_BYTE_2_3_3_REV             = 0x8362;
enum uint GL_UNSIGNED_SHORT_5_6_5                = 0x8363;
enum uint GL_UNSIGNED_SHORT_5_6_5_REV            = 0x8364;
enum uint GL_UNSIGNED_SHORT_4_4_4_4              = 0x8033;
enum uint GL_UNSIGNED_SHORT_4_4_4_4_REV          = 0x8365;
enum uint GL_UNSIGNED_SHORT_5_5_5_1              = 0x8034;
enum uint GL_UNSIGNED_SHORT_1_5_5_5_REV          = 0x8366;
enum uint GL_UNSIGNED_INT_8_8_8_8                = 0x8035;
enum uint GL_UNSIGNED_INT_8_8_8_8_REV            = 0x8367;
enum uint GL_UNSIGNED_INT_10_10_10_2             = 0x8036;
enum uint GL_UNSIGNED_INT_2_10_10_10_REV         = 0x8368;
enum uint GL_LIGHT_MODEL_COLOR_CONTROL           = 0x81F8;
enum uint GL_SINGLE_COLOR                        = 0x81F9;
enum uint GL_SEPARATE_SPECULAR_COLOR             = 0x81FA;
enum uint GL_TEXTURE_MIN_LOD                     = 0x813A;
enum uint GL_TEXTURE_MAX_LOD                     = 0x813B;
enum uint GL_TEXTURE_BASE_LEVEL                  = 0x813C;
enum uint GL_TEXTURE_MAX_LEVEL                   = 0x813D;
enum uint GL_SMOOTH_POINT_SIZE_RANGE             = 0x0B12;
enum uint GL_SMOOTH_POINT_SIZE_GRANULARITY       = 0x0B13;
enum uint GL_SMOOTH_LINE_WIDTH_RANGE             = 0x0B22;
enum uint GL_SMOOTH_LINE_WIDTH_GRANULARITY       = 0x0B23;
enum uint GL_ALIASED_POINT_SIZE_RANGE            = 0x846D;
enum uint GL_ALIASED_LINE_WIDTH_RANGE            = 0x846E;
enum uint GL_PACK_SKIP_IMAGES                    = 0x806B;
enum uint GL_PACK_IMAGE_HEIGHT                   = 0x806C;
enum uint GL_UNPACK_SKIP_IMAGES                  = 0x806D;
enum uint GL_UNPACK_IMAGE_HEIGHT                 = 0x806E;
enum uint GL_TEXTURE_3D                          = 0x806F;
enum uint GL_PROXY_TEXTURE_3D                    = 0x8070;
enum uint GL_TEXTURE_DEPTH                       = 0x8071;
enum uint GL_TEXTURE_WRAP_R                      = 0x8072;
enum uint GL_MAX_3D_TEXTURE_SIZE                 = 0x8073;
enum uint GL_TEXTURE_BINDING_3D                  = 0x806A;


/* OpenGL 1.3 */
/* multitexture */
enum uint GL_TEXTURE0                            = 0x84C0;
enum uint GL_TEXTURE1                            = 0x84C1;
enum uint GL_TEXTURE2                            = 0x84C2;
enum uint GL_TEXTURE3                            = 0x84C3;
enum uint GL_TEXTURE4                            = 0x84C4;
enum uint GL_TEXTURE5                            = 0x84C5;
enum uint GL_TEXTURE6                            = 0x84C6;
enum uint GL_TEXTURE7                            = 0x84C7;
enum uint GL_TEXTURE8                            = 0x84C8;
enum uint GL_TEXTURE9                            = 0x84C9;
enum uint GL_TEXTURE10                           = 0x84CA;
enum uint GL_TEXTURE11                           = 0x84CB;
enum uint GL_TEXTURE12                           = 0x84CC;
enum uint GL_TEXTURE13                           = 0x84CD;
enum uint GL_TEXTURE14                           = 0x84CE;
enum uint GL_TEXTURE15                           = 0x84CF;
enum uint GL_TEXTURE16                           = 0x84D0;
enum uint GL_TEXTURE17                           = 0x84D1;
enum uint GL_TEXTURE18                           = 0x84D2;
enum uint GL_TEXTURE19                           = 0x84D3;
enum uint GL_TEXTURE20                           = 0x84D4;
enum uint GL_TEXTURE21                           = 0x84D5;
enum uint GL_TEXTURE22                           = 0x84D6;
enum uint GL_TEXTURE23                           = 0x84D7;
enum uint GL_TEXTURE24                           = 0x84D8;
enum uint GL_TEXTURE25                           = 0x84D9;
enum uint GL_TEXTURE26                           = 0x84DA;
enum uint GL_TEXTURE27                           = 0x84DB;
enum uint GL_TEXTURE28                           = 0x84DC;
enum uint GL_TEXTURE29                           = 0x84DD;
enum uint GL_TEXTURE30                           = 0x84DE;
enum uint GL_TEXTURE31                           = 0x84DF;
enum uint GL_ACTIVE_TEXTURE                      = 0x84E0;
enum uint GL_CLIENT_ACTIVE_TEXTURE               = 0x84E1;
enum uint GL_MAX_TEXTURE_UNITS                   = 0x84E2;
/* texture_cube_map */
enum uint GL_NORMAL_MAP                          = 0x8511;
enum uint GL_REFLECTION_MAP                      = 0x8512;
enum uint GL_TEXTURE_CUBE_MAP                    = 0x8513;
enum uint GL_TEXTURE_BINDING_CUBE_MAP            = 0x8514;
enum uint GL_TEXTURE_CUBE_MAP_POSITIVE_X         = 0x8515;
enum uint GL_TEXTURE_CUBE_MAP_NEGATIVE_X         = 0x8516;
enum uint GL_TEXTURE_CUBE_MAP_POSITIVE_Y         = 0x8517;
enum uint GL_TEXTURE_CUBE_MAP_NEGATIVE_Y         = 0x8518;
enum uint GL_TEXTURE_CUBE_MAP_POSITIVE_Z         = 0x8519;
enum uint GL_TEXTURE_CUBE_MAP_NEGATIVE_Z         = 0x851A;
enum uint GL_PROXY_TEXTURE_CUBE_MAP              = 0x851B;
enum uint GL_MAX_CUBE_MAP_TEXTURE_SIZE           = 0x851C;
/* texture_compression */
enum uint GL_COMPRESSED_ALPHA                    = 0x84E9;
enum uint GL_COMPRESSED_LUMINANCE                = 0x84EA;
enum uint GL_COMPRESSED_LUMINANCE_ALPHA          = 0x84EB;
enum uint GL_COMPRESSED_INTENSITY                = 0x84EC;
enum uint GL_COMPRESSED_RGB                      = 0x84ED;
enum uint GL_COMPRESSED_RGBA                     = 0x84EE;
enum uint GL_TEXTURE_COMPRESSION_HINT            = 0x84EF;
enum uint GL_TEXTURE_COMPRESSED_IMAGE_SIZE       = 0x86A0;
enum uint GL_TEXTURE_COMPRESSED                  = 0x86A1;
enum uint GL_NUM_COMPRESSED_TEXTURE_FORMATS      = 0x86A2;
enum uint GL_COMPRESSED_TEXTURE_FORMATS          = 0x86A3;
/* multisample */
enum uint GL_MULTISAMPLE                         = 0x809D;
enum uint GL_SAMPLE_ALPHA_TO_COVERAGE            = 0x809E;
enum uint GL_SAMPLE_ALPHA_TO_ONE                 = 0x809F;
enum uint GL_SAMPLE_COVERAGE                     = 0x80A0;
enum uint GL_SAMPLE_BUFFERS                      = 0x80A8;
enum uint GL_SAMPLES                             = 0x80A9;
enum uint GL_SAMPLE_COVERAGE_VALUE               = 0x80AA;
enum uint GL_SAMPLE_COVERAGE_INVERT              = 0x80AB;
enum uint GL_MULTISAMPLE_BIT                     = 0x20000000;
/* transpose_matrix */
enum uint GL_TRANSPOSE_MODELVIEW_MATRIX          = 0x84E3;
enum uint GL_TRANSPOSE_PROJECTION_MATRIX         = 0x84E4;
enum uint GL_TRANSPOSE_TEXTURE_MATRIX            = 0x84E5;
enum uint GL_TRANSPOSE_COLOR_MATRIX              = 0x84E6;
/* texture_env_combine */
enum uint GL_COMBINE                             = 0x8570;
enum uint GL_COMBINE_RGB                         = 0x8571;
enum uint GL_COMBINE_ALPHA                       = 0x8572;
enum uint GL_SOURCE0_RGB                         = 0x8580;
enum uint GL_SOURCE1_RGB                         = 0x8581;
enum uint GL_SOURCE2_RGB                         = 0x8582;
enum uint GL_SOURCE0_ALPHA                       = 0x8588;
enum uint GL_SOURCE1_ALPHA                       = 0x8589;
enum uint GL_SOURCE2_ALPHA                       = 0x858A;
enum uint GL_OPERAND0_RGB                        = 0x8590;
enum uint GL_OPERAND1_RGB                        = 0x8591;
enum uint GL_OPERAND2_RGB                        = 0x8592;
enum uint GL_OPERAND0_ALPHA                      = 0x8598;
enum uint GL_OPERAND1_ALPHA                      = 0x8599;
enum uint GL_OPERAND2_ALPHA                      = 0x859A;
enum uint GL_RGB_SCALE                           = 0x8573;
enum uint GL_ADD_SIGNED                          = 0x8574;
enum uint GL_INTERPOLATE                         = 0x8575;
enum uint GL_SUBTRACT                            = 0x84E7;
enum uint GL_CONSTANT                            = 0x8576;
enum uint GL_PRIMARY_COLOR                       = 0x8577;
enum uint GL_PREVIOUS                            = 0x8578;
/* texture_env_dot3 */
enum uint GL_DOT3_RGB                            = 0x86AE;
enum uint GL_DOT3_RGBA                           = 0x86AF;
/* texture_border_clamp */
enum uint GL_CLAMP_TO_BORDER                     = 0x812D;


/* OpenGL 1.4 */
enum uint GL_GENERATE_MIPMAP                     = 0x8191;
enum uint GL_GENERATE_MIPMAP_HINT                = 0x8192;
enum uint GL_DEPTH_COMPONENT16                   = 0x81A5;
enum uint GL_DEPTH_COMPONENT24                   = 0x81A6;
enum uint GL_DEPTH_COMPONENT32                   = 0x81A7;
enum uint GL_TEXTURE_DEPTH_SIZE                  = 0x884A;
enum uint GL_DEPTH_TEXTURE_MODE                  = 0x884B;
enum uint GL_TEXTURE_COMPARE_MODE                = 0x884C;
enum uint GL_TEXTURE_COMPARE_FUNC                = 0x884D;
enum uint GL_COMPARE_R_TO_TEXTURE                = 0x884E;
enum uint GL_FOG_COORDINATE_SOURCE               = 0x8450;
enum uint GL_FOG_COORDINATE                      = 0x8451;
enum uint GL_FRAGMENT_DEPTH                      = 0x8452;
enum uint GL_CURRENT_FOG_COORDINATE              = 0x8453;
enum uint GL_FOG_COORDINATE_ARRAY_TYPE           = 0x8454;
enum uint GL_FOG_COORDINATE_ARRAY_STRIDE         = 0x8455;
enum uint GL_FOG_COORDINATE_ARRAY_POINTER        = 0x8456;
enum uint GL_FOG_COORDINATE_ARRAY                = 0x8457;
enum uint GL_POINT_SIZE_MIN                      = 0x8126;
enum uint GL_POINT_SIZE_MAX                      = 0x8127;
enum uint GL_POINT_FADE_THRESHOLD_SIZE           = 0x8128;
enum uint GL_POINT_DISTANCE_ATTENUATION          = 0x8129;
enum uint GL_COLOR_SUM                           = 0x8458;
enum uint GL_CURRENT_SECONDARY_COLOR             = 0x8459;
enum uint GL_SECONDARY_COLOR_ARRAY_SIZE          = 0x845A;
enum uint GL_SECONDARY_COLOR_ARRAY_TYPE          = 0x845B;
enum uint GL_SECONDARY_COLOR_ARRAY_STRIDE        = 0x845C;
enum uint GL_SECONDARY_COLOR_ARRAY_POINTER       = 0x845D;
enum uint GL_SECONDARY_COLOR_ARRAY               = 0x845E;
enum uint GL_BLEND_DST_RGB                       = 0x80C8;
enum uint GL_BLEND_SRC_RGB                       = 0x80C9;
enum uint GL_BLEND_DST_ALPHA                     = 0x80CA;
enum uint GL_BLEND_SRC_ALPHA                     = 0x80CB;
enum uint GL_INCR_WRAP                           = 0x8507;
enum uint GL_DECR_WRAP                           = 0x8508;
enum uint GL_TEXTURE_FILTER_CONTROL              = 0x8500;
enum uint GL_TEXTURE_LOD_BIAS                    = 0x8501;
enum uint GL_MAX_TEXTURE_LOD_BIAS                = 0x84FD;
enum uint GL_MIRRORED_REPEAT                     = 0x8370;




/************************************************************************
 *
 * Function prototypes
 *
 ************************************************************************/

/* Miscellaneous */
void glClearIndex( GLfloat c );
void glClearColor( GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha );
void glClear( GLbitfield mask );
void glIndexMask( GLuint mask );
void glColorMask( GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha );
void glAlphaFunc( GLenum func, GLclampf reference );
void glBlendFunc( GLenum sfactor, GLenum dfactor );
void glLogicOp( GLenum opcode );
void glCullFace( GLenum mode );
void glFrontFace( GLenum mode );
void glPointSize( GLfloat size );
void glLineWidth( GLfloat width );
void glLineStipple( GLint factor, GLushort pattern );
void glPolygonMode( GLenum face, GLenum mode );
void glPolygonOffset( GLfloat factor, GLfloat units );
void glPolygonStipple( in GLubyte *mask );
void glGetPolygonStipple( GLubyte *mask );
void glEdgeFlag( GLboolean flag );
void glEdgeFlagv( in GLboolean *flag );
void glScissor( GLint x, GLint y, GLsizei width, GLsizei height);
void glClipPlane( GLenum plane, in GLdouble *equation );
void glGetClipPlane( GLenum plane, GLdouble *equation );
void glDrawBuffer( GLenum mode );
void glReadBuffer( GLenum mode );
void glEnable( GLenum cap );
void glDisable( GLenum cap );
GLboolean glIsEnabled( GLenum cap );
void glEnableClientState( GLenum cap );  /* 1.1 */
void glDisableClientState( GLenum cap );  /* 1.1 */
void glGetBooleanv( GLenum pname, GLboolean *params );
void glGetDoublev( GLenum pname, GLdouble *params );
void glGetFloatv( GLenum pname, GLfloat *params );
void glGetIntegerv( GLenum pname, GLint *params );
void glPushAttrib( GLbitfield mask );
void glPopAttrib();
void glPushClientAttrib( GLbitfield mask );  /* 1.1 */
void glPopClientAttrib();  /* 1.1 */
GLint glRenderMode( GLenum mode );
GLenum glGetError();
GLubyte* glGetString( GLenum name );
void glFinish();
void glFlush();
void glHint( GLenum target, GLenum mode );

/* Depth Buffer */
void glClearDepth( GLclampd depth );
void glDepthFunc( GLenum func );
void glDepthMask( GLboolean flag );
void glDepthRange( GLclampd near_val, GLclampd far_val );

/* Accumulation Buffer */
void glClearAccum( GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha );
void glAccum( GLenum op, GLfloat value );

/* Transformation */
void glMatrixMode( GLenum mode );
void glOrtho( GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble near_val, GLdouble far_val );
void glFrustum( GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble near_val, GLdouble far_val );
void glViewport( GLint x, GLint y, GLsizei width, GLsizei height );
void glPushMatrix();
void glPopMatrix();
void glLoadIdentity();
void glLoadMatrixd( in GLdouble *m );
void glLoadMatrixf( in GLfloat *m );
void glMultMatrixd( in GLdouble *m );
void glMultMatrixf( in GLfloat *m );
void glRotated( GLdouble angle, GLdouble x, GLdouble y, GLdouble z );
void glRotatef( GLfloat angle, GLfloat x, GLfloat y, GLfloat z );
void glScaled( GLdouble x, GLdouble y, GLdouble z );
void glScalef( GLfloat x, GLfloat y, GLfloat z );
void glTranslated( GLdouble x, GLdouble y, GLdouble z );
void glTranslatef( GLfloat x, GLfloat y, GLfloat z );

/* Display Lists */
GLboolean glIsList( GLuint list );
void glDeleteLists( GLuint list, GLsizei range );
GLuint glGenLists( GLsizei range );
void glNewList( GLuint list, GLenum mode );
void glEndList();
void glCallList( GLuint list );
void glCallLists( GLsizei n, GLenum type, in GLvoid *lists );
void glListBase( GLuint base );

/* Drawing Functions */
void glBegin( GLenum mode );
void glEnd();
void glVertex2d( GLdouble x, GLdouble y );
void glVertex2f( GLfloat x, GLfloat y );
void glVertex2i( GLint x, GLint y );
void glVertex2s( GLshort x, GLshort y );
void glVertex3d( GLdouble x, GLdouble y, GLdouble z );
void glVertex3f( GLfloat x, GLfloat y, GLfloat z );
void glVertex3i( GLint x, GLint y, GLint z );
void glVertex3s( GLshort x, GLshort y, GLshort z );
void glVertex4d( GLdouble x, GLdouble y, GLdouble z, GLdouble w );
void glVertex4f( GLfloat x, GLfloat y, GLfloat z, GLfloat w );
void glVertex4i( GLint x, GLint y, GLint z, GLint w );
void glVertex4s( GLshort x, GLshort y, GLshort z, GLshort w );
void glVertex2dv( in GLdouble *v );
void glVertex2fv( in GLfloat *v );
void glVertex2iv( in GLint *v );
void glVertex2sv( in GLshort *v );
void glVertex3dv( in GLdouble *v );
void glVertex3fv( in GLfloat *v );
void glVertex3iv( in GLint *v );
void glVertex3sv( in GLshort *v );
void glVertex4dv( in GLdouble *v );
void glVertex4fv( in GLfloat *v );
void glVertex4iv( in GLint *v );
void glVertex4sv( in GLshort *v );
void glNormal3b( GLbyte nx, GLbyte ny, GLbyte nz );
void glNormal3d( GLdouble nx, GLdouble ny, GLdouble nz );
void glNormal3f( GLfloat nx, GLfloat ny, GLfloat nz );
void glNormal3i( GLint nx, GLint ny, GLint nz );
void glNormal3s( GLshort nx, GLshort ny, GLshort nz );
void glNormal3bv( in GLbyte *v );
void glNormal3dv( in GLdouble *v );
void glNormal3fv( in GLfloat *v );
void glNormal3iv( in GLint *v );
void glNormal3sv( in GLshort *v );
void glIndexd( GLdouble c );
void glIndexf( GLfloat c );
void glIndexi( GLint c );
void glIndexs( GLshort c );
void glIndexub( GLubyte c );  /* 1.1 */
void glIndexdv( in GLdouble *c );
void glIndexfv( in GLfloat *c );
void glIndexiv( in GLint *c );
void glIndexsv( in GLshort *c );
void glIndexubv( in GLubyte *c );  /* 1.1 */
void glColor3b( GLbyte red, GLbyte green, GLbyte blue );
void glColor3d( GLdouble red, GLdouble green, GLdouble blue );
void glColor3f( GLfloat red, GLfloat green, GLfloat blue );
void glColor3i( GLint red, GLint green, GLint blue );
void glColor3s( GLshort red, GLshort green, GLshort blue );
void glColor3ub( GLubyte red, GLubyte green, GLubyte blue );
void glColor3ui( GLuint red, GLuint green, GLuint blue );
void glColor3us( GLushort red, GLushort green, GLushort blue );
void glColor4b( GLbyte red, GLbyte green, GLbyte blue, GLbyte alpha );
void glColor4d( GLdouble red, GLdouble green, GLdouble blue, GLdouble alpha );
void glColor4f( GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha );
void glColor4i( GLint red, GLint green, GLint blue, GLint alpha );
void glColor4s( GLshort red, GLshort green, GLshort blue, GLshort alpha );
void glColor4ub( GLubyte red, GLubyte green, GLubyte blue, GLubyte alpha );
void glColor4ui( GLuint red, GLuint green, GLuint blue, GLuint alpha );
void glColor4us( GLushort red, GLushort green, GLushort blue, GLushort alpha );
void glColor3bv( in GLbyte *v );
void glColor3dv( in GLdouble *v );
void glColor3fv( in GLfloat *v );
void glColor3iv( in GLint *v );
void glColor3sv( in GLshort *v );
void glColor3ubv( in GLubyte *v );
void glColor3uiv( in GLuint *v );
void glColor3usv( in GLushort *v );
void glColor4bv( in GLbyte *v );
void glColor4dv( in GLdouble *v );
void glColor4fv( in GLfloat *v );
void glColor4iv( in GLint *v );
void glColor4sv( in GLshort *v );
void glColor4ubv( in GLubyte *v );
void glColor4uiv( in GLuint *v );
void glColor4usv( in GLushort *v );
void glTexCoord1d( GLdouble s );
void glTexCoord1f( GLfloat s );
void glTexCoord1i( GLint s );
void glTexCoord1s( GLshort s );
void glTexCoord2d( GLdouble s, GLdouble t );
void glTexCoord2f( GLfloat s, GLfloat t );
void glTexCoord2i( GLint s, GLint t );
void glTexCoord2s( GLshort s, GLshort t );
void glTexCoord3d( GLdouble s, GLdouble t, GLdouble r );
void glTexCoord3f( GLfloat s, GLfloat t, GLfloat r );
void glTexCoord3i( GLint s, GLint t, GLint r );
void glTexCoord3s( GLshort s, GLshort t, GLshort r );
void glTexCoord4d( GLdouble s, GLdouble t, GLdouble r, GLdouble q );
void glTexCoord4f( GLfloat s, GLfloat t, GLfloat r, GLfloat q );
void glTexCoord4i( GLint s, GLint t, GLint r, GLint q );
void glTexCoord4s( GLshort s, GLshort t, GLshort r, GLshort q );
void glTexCoord1dv( in GLdouble *v );
void glTexCoord1fv( in GLfloat *v );
void glTexCoord1iv( in GLint *v );
void glTexCoord1sv( in GLshort *v );
void glTexCoord2dv( in GLdouble *v );
void glTexCoord2fv( in GLfloat *v );
void glTexCoord2iv( in GLint *v );
void glTexCoord2sv( in GLshort *v );
void glTexCoord3dv( in GLdouble *v );
void glTexCoord3fv( in GLfloat *v );
void glTexCoord3iv( in GLint *v );
void glTexCoord3sv( in GLshort *v );
void glTexCoord4dv( in GLdouble *v );
void glTexCoord4fv( in GLfloat *v );
void glTexCoord4iv( in GLint *v );
void glTexCoord4sv( in GLshort *v );
void glRasterPos2d( GLdouble x, GLdouble y );
void glRasterPos2f( GLfloat x, GLfloat y );
void glRasterPos2i( GLint x, GLint y );
void glRasterPos2s( GLshort x, GLshort y );
void glRasterPos3d( GLdouble x, GLdouble y, GLdouble z );
void glRasterPos3f( GLfloat x, GLfloat y, GLfloat z );
void glRasterPos3i( GLint x, GLint y, GLint z );
void glRasterPos3s( GLshort x, GLshort y, GLshort z );
void glRasterPos4d( GLdouble x, GLdouble y, GLdouble z, GLdouble w );
void glRasterPos4f( GLfloat x, GLfloat y, GLfloat z, GLfloat w );
void glRasterPos4i( GLint x, GLint y, GLint z, GLint w );
void glRasterPos4s( GLshort x, GLshort y, GLshort z, GLshort w );
void glRasterPos2dv( in GLdouble *v );
void glRasterPos2fv( in GLfloat *v );
void glRasterPos2iv( in GLint *v );
void glRasterPos2sv( in GLshort *v );
void glRasterPos3dv( in GLdouble *v );
void glRasterPos3fv( in GLfloat *v );
void glRasterPos3iv( in GLint *v );
void glRasterPos3sv( in GLshort *v );
void glRasterPos4dv( in GLdouble *v );
void glRasterPos4fv( in GLfloat *v );
void glRasterPos4iv( in GLint *v );
void glRasterPos4sv( in GLshort *v );
void glRectd( GLdouble x1, GLdouble y1, GLdouble x2, GLdouble y2 );
void glRectf( GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2 );
void glRecti( GLint x1, GLint y1, GLint x2, GLint y2 );
void glRects( GLshort x1, GLshort y1, GLshort x2, GLshort y2 );
void glRectdv( in GLdouble *v1, in GLdouble *v2 );
void glRectfv( in GLfloat *v1, in GLfloat *v2 );
void glRectiv( in GLint *v1, in GLint *v2 );
void glRectsv( in GLshort *v1, in GLshort *v2 );

/* Lighting */
void glShadeModel( GLenum mode );
void glLightf( GLenum light, GLenum pname, GLfloat param );
void glLighti( GLenum light, GLenum pname, GLint param );
void glLightfv( GLenum light, GLenum pname, in GLfloat *params );
void glLightiv( GLenum light, GLenum pname, in GLint *params );
void glGetLightfv( GLenum light, GLenum pname, GLfloat *params );
void glGetLightiv( GLenum light, GLenum pname, GLint *params );
void glLightModelf( GLenum pname, GLfloat param );
void glLightModeli( GLenum pname, GLint param );
void glLightModelfv( GLenum pname, in GLfloat *params );
void glLightModeliv( GLenum pname, in GLint *params );
void glMaterialf( GLenum face, GLenum pname, GLfloat param );
void glMateriali( GLenum face, GLenum pname, GLint param );
void glMaterialfv( GLenum face, GLenum pname, in GLfloat *params );
void glMaterialiv( GLenum face, GLenum pname, in GLint *params );
void glGetMaterialfv( GLenum face, GLenum pname, GLfloat *params );
void glGetMaterialiv( GLenum face, GLenum pname, GLint *params );
void glColorMaterial( GLenum face, GLenum mode );

/* Raster functions */
void glPixelZoom( GLfloat xfactor, GLfloat yfactor );
void glPixelStoref( GLenum pname, GLfloat param );
void glPixelStorei( GLenum pname, GLint param );
void glPixelTransferf( GLenum pname, GLfloat param );
void glPixelTransferi( GLenum pname, GLint param );
void glPixelMapfv( GLenum map, GLint mapsize, in GLfloat *values );
void glPixelMapuiv( GLenum map, GLint mapsize, in GLuint *values );
void glPixelMapusv( GLenum map, GLint mapsize, in GLushort *values );
void glGetPixelMapfv( GLenum map, GLfloat *values );
void glGetPixelMapuiv( GLenum map, GLuint *values );
void glGetPixelMapusv( GLenum map, GLushort *values );
void glBitmap( GLsizei width, GLsizei height, GLfloat xorig, GLfloat yorig, GLfloat xmove, GLfloat ymove, GLubyte *bitmap );
void glReadPixels( GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels );
void glDrawPixels( GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels );
void glCopyPixels( GLint x, GLint y, GLsizei width, GLsizei height, GLenum type );

/* Stenciling */
void glStencilFunc( GLenum func, GLint reference, GLuint mask );
void glStencilMask( GLuint mask );
void glStencilOp( GLenum fail, GLenum zfail, GLenum zpass );
void glClearStencil( GLint s );

/* Texture mapping */
void glTexGend( GLenum coord, GLenum pname, GLdouble param );
void glTexGenf( GLenum coord, GLenum pname, GLfloat param );
void glTexGeni( GLenum coord, GLenum pname, GLint param );
void glTexGendv( GLenum coord, GLenum pname, in GLdouble *params );
void glTexGenfv( GLenum coord, GLenum pname, in GLfloat *params );
void glTexGeniv( GLenum coord, GLenum pname, in GLint *params );
void glGetTexGendv( GLenum coord, GLenum pname, GLdouble *params );
void glGetTexGenfv( GLenum coord, GLenum pname, GLfloat *params );
void glGetTexGeniv( GLenum coord, GLenum pname, GLint *params );
void glTexEnvf( GLenum target, GLenum pname, GLfloat param );
void glTexEnvi( GLenum target, GLenum pname, GLint param );
void glTexEnvfv( GLenum target, GLenum pname, in GLfloat *params );
void glTexEnviv( GLenum target, GLenum pname, in GLint *params );
void glGetTexEnvfv( GLenum target, GLenum pname, GLfloat *params );
void glGetTexEnviv( GLenum target, GLenum pname, GLint *params );
void glTexParameterf( GLenum target, GLenum pname, GLfloat param );
void glTexParameteri( GLenum target, GLenum pname, GLint param );
void glTexParameterfv( GLenum target, GLenum pname, in GLfloat *params );
void glTexParameteriv( GLenum target, GLenum pname, in GLint *params );
void glGetTexParameterfv( GLenum target, GLenum pname, GLfloat *params);
void glGetTexParameteriv( GLenum target, GLenum pname, GLint *params );
void glGetTexLevelParameterfv( GLenum target, GLint level, GLenum pname, GLfloat *params );
void glGetTexLevelParameteriv( GLenum target, GLint level, GLenum pname, GLint *params );
void glTexImage1D( GLenum target, GLint level, GLint internalFormat, GLsizei width, GLint border, GLenum format, GLenum type, in GLvoid *pixels );
void glTexImage2D( GLenum target, GLint level, GLint internalFormat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, in GLvoid *pixels );
void glGetTexImage( GLenum target, GLint level, GLenum format, GLenum type, GLvoid *pixels );

/* Evaluators */
void glMap1d( GLenum target, GLdouble u1, GLdouble u2, GLint stride, GLint order, in GLdouble *points );
void glMap1f( GLenum target, GLfloat u1, GLfloat u2, GLint stride, GLint order, in GLfloat *points );
void glMap2d( GLenum target, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, in GLdouble *points );
void glMap2f( GLenum target, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, in GLfloat *points );
void glGetMapdv( GLenum target, GLenum query, GLdouble *v );
void glGetMapfv( GLenum target, GLenum query, GLfloat *v );
void glGetMapiv( GLenum target, GLenum query, GLint *v );
void glEvalCoord1d( GLdouble u );
void glEvalCoord1f( GLfloat u );
void glEvalCoord1dv( in GLdouble *u );
void glEvalCoord1fv( in GLfloat *u );
void glEvalCoord2d( GLdouble u, GLdouble v );
void glEvalCoord2f( GLfloat u, GLfloat v );
void glEvalCoord2dv( in GLdouble *u );
void glEvalCoord2fv( in GLfloat *u );
void glMapGrid1d( GLint un, GLdouble u1, GLdouble u2 );
void glMapGrid1f( GLint un, GLfloat u1, GLfloat u2 );
void glMapGrid2d( GLint un, GLdouble u1, GLdouble u2, GLint vn, GLdouble v1, GLdouble v2 );
void glMapGrid2f( GLint un, GLfloat u1, GLfloat u2, GLint vn, GLfloat v1, GLfloat v2 );
void glEvalPoint1( GLint i );
void glEvalPoint2( GLint i, GLint j );
void glEvalMesh1( GLenum mode, GLint i1, GLint i2 );
void glEvalMesh2( GLenum mode, GLint i1, GLint i2, GLint j1, GLint j2 );

/* Fog */
void glFogf( GLenum pname, GLfloat param );
void glFogi( GLenum pname, GLint param );
void glFogfv( GLenum pname, in GLfloat *params );
void glFogiv( GLenum pname, in GLint *params );

/* Selection and Feedback */
void glFeedbackBuffer( GLsizei size, GLenum type, GLfloat *buffer );
void glPassThrough( GLfloat token );
void glSelectBuffer( GLsizei size, GLuint *buffer );
void glInitNames();
void glLoadName( GLuint name );
void glPushName( GLuint name );
void glPopName();


/* OpenGL 1.1 functions */
/* texture objects */
void glGenTextures( GLsizei n, GLuint *textures );
void glDeleteTextures( GLsizei n, in GLuint *textures );
void glBindTexture( GLenum target, GLuint texture );
void glPrioritizeTextures( GLsizei n, in GLuint *textures, in GLclampf *priorities );
GLboolean glAreTexturesResident( GLsizei n, in GLuint *textures, GLboolean *residences );
GLboolean glIsTexture( GLuint texture );
/* texture mapping */
void glTexSubImage1D( GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, GLvoid *pixels );
void glTexSubImage2D( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels );
void glCopyTexImage1D( GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border );
void glCopyTexImage2D( GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border );
void glCopyTexSubImage1D( GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width );
void glCopyTexSubImage2D( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height );
/* vertex arrays */
void glVertexPointer( GLint size, GLenum type, GLsizei stride, in GLvoid *ptr );
void glNormalPointer( GLenum type, GLsizei stride, in GLvoid *ptr );
void glColorPointer( GLint size, GLenum type, GLsizei stride, in GLvoid *ptr );
void glIndexPointer( GLenum type, GLsizei stride, in GLvoid *ptr );
void glTexCoordPointer( GLint size, GLenum type, GLsizei stride, in GLvoid *ptr );
void glEdgeFlagPointer( GLsizei stride, in GLvoid *ptr );
void glGetPointerv( GLenum pname, GLvoid **params );
void glArrayElement( GLint i );
void glDrawArrays( GLenum mode, GLint first, GLsizei count );
void glDrawElements( GLenum mode, GLsizei count, GLenum type, in GLvoid *indices );
void glInterleavedArrays( GLenum format, GLsizei stride, in GLvoid *pointer );



/************************************************************************
 * OpenGL 1.2 -> 1.4 function pointer types
 * Note: Proper OpenGL version checking must be performed to use these.
 ************************************************************************/

/* OpenGL 1.2 */
alias PFNGLBLENDCOLORPROC = void function(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
alias PFNGLBLENDEQUATIONPROC = void function(GLenum mode);
alias PFNGLDRAWRANGEELEMENTSPROC = void function(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, GLvoid *indices);
alias PFNGLCOLORTABLEPROC = void function(GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, GLvoid *table);
alias PFNGLCOLORTABLEPARAMETERFVPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLCOLORTABLEPARAMETERIVPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLCOPYCOLORTABLEPROC = void function(GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
alias PFNGLGETCOLORTABLEPROC = void function(GLenum target, GLenum format, GLenum type, GLvoid *table);
alias PFNGLGETCOLORTABLEPARAMETERFVPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLGETCOLORTABLEPARAMETERIVPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLCOLORSUBTABLEPROC = void function(GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, GLvoid *data);
alias PFNGLCOPYCOLORSUBTABLEPROC = void function(GLenum target, GLsizei start, GLint x, GLint y, GLsizei width);
alias PFNGLCONVOLUTIONFILTER1DPROC = void function(GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, GLvoid *image);
alias PFNGLCONVOLUTIONFILTER2DPROC = void function(GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *image);
alias PFNGLCONVOLUTIONPARAMETERFPROC = void function(GLenum target, GLenum pname, GLfloat params);
alias PFNGLCONVOLUTIONPARAMETERFVPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLCONVOLUTIONPARAMETERIPROC = void function(GLenum target, GLenum pname, GLint params);
alias PFNGLCONVOLUTIONPARAMETERIVPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLCOPYCONVOLUTIONFILTER1DPROC = void function(GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
alias PFNGLCOPYCONVOLUTIONFILTER2DPROC = void function(GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height);
alias PFNGLGETCONVOLUTIONFILTERPROC = void function(GLenum target, GLenum format, GLenum type, GLvoid *image);
alias PFNGLGETCONVOLUTIONPARAMETERFVPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLGETCONVOLUTIONPARAMETERIVPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLGETSEPARABLEFILTERPROC = void function(GLenum target, GLenum format, GLenum type, GLvoid *row, GLvoid *column, GLvoid *span);
alias PFNGLSEPARABLEFILTER2DPROC = void function(GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *row, GLvoid *column);
alias PFNGLGETHISTOGRAMPROC = void function(GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
alias PFNGLGETHISTOGRAMPARAMETERFVPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLGETHISTOGRAMPARAMETERIVPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLGETMINMAXPROC = void function(GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
alias PFNGLGETMINMAXPARAMETERFVPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLGETMINMAXPARAMETERIVPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLHISTOGRAMPROC = void function(GLenum target, GLsizei width, GLenum internalformat, GLboolean sink);
alias PFNGLMINMAXPROC = void function(GLenum target, GLenum internalformat, GLboolean sink);
alias PFNGLRESETHISTOGRAMPROC = void function(GLenum target);
alias PFNGLRESETMINMAXPROC = void function(GLenum target);
alias PFNGLTEXIMAGE3DPROC = void function(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, GLvoid *pixels);
alias PFNGLTEXSUBIMAGE3DPROC = void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLvoid *pixels);
alias PFNGLCOPYTEXSUBIMAGE3DPROC = void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);


/* OpenGL 1.3 */
alias PFNGLACTIVETEXTUREPROC = void function(GLenum texture);
alias PFNGLCLIENTACTIVETEXTUREPROC = void function(GLenum texture);
alias PFNGLMULTITEXCOORD1DPROC = void function(GLenum target, GLdouble s);
alias PFNGLMULTITEXCOORD1DVPROC = void function(GLenum target, GLdouble *v);
alias PFNGLMULTITEXCOORD1FPROC = void function(GLenum target, GLfloat s);
alias PFNGLMULTITEXCOORD1FVPROC = void function(GLenum target, GLfloat *v);
alias PFNGLMULTITEXCOORD1IPROC = void function(GLenum target, GLint s);
alias PFNGLMULTITEXCOORD1IVPROC = void function(GLenum target, GLint *v);
alias PFNGLMULTITEXCOORD1SPROC = void function(GLenum target, GLshort s);
alias PFNGLMULTITEXCOORD1SVPROC = void function(GLenum target, GLshort *v);
alias PFNGLMULTITEXCOORD2DPROC = void function(GLenum target, GLdouble s, GLdouble t);
alias PFNGLMULTITEXCOORD2DVPROC = void function(GLenum target, GLdouble *v);
alias PFNGLMULTITEXCOORD2FPROC = void function(GLenum target, GLfloat s, GLfloat t);
alias PFNGLMULTITEXCOORD2FVPROC = void function(GLenum target, GLfloat *v);
alias PFNGLMULTITEXCOORD2IPROC = void function(GLenum target, GLint s, GLint t);
alias PFNGLMULTITEXCOORD2IVPROC = void function(GLenum target, GLint *v);
alias PFNGLMULTITEXCOORD2SPROC = void function(GLenum target, GLshort s, GLshort t);
alias PFNGLMULTITEXCOORD2SVPROC = void function(GLenum target, GLshort *v);
alias PFNGLMULTITEXCOORD3DPROC = void function(GLenum target, GLdouble s, GLdouble t, GLdouble r);
alias PFNGLMULTITEXCOORD3DVPROC = void function(GLenum target, GLdouble *v);
alias PFNGLMULTITEXCOORD3FPROC = void function(GLenum target, GLfloat s, GLfloat t, GLfloat r);
alias PFNGLMULTITEXCOORD3FVPROC = void function(GLenum target, GLfloat *v);
alias PFNGLMULTITEXCOORD3IPROC = void function(GLenum target, GLint s, GLint t, GLint r);
alias PFNGLMULTITEXCOORD3IVPROC = void function(GLenum target, GLint *v);
alias PFNGLMULTITEXCOORD3SPROC = void function(GLenum target, GLshort s, GLshort t, GLshort r);
alias PFNGLMULTITEXCOORD3SVPROC = void function(GLenum target, GLshort *v);
alias PFNGLMULTITEXCOORD4DPROC = void function(GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q);
alias PFNGLMULTITEXCOORD4DVPROC = void function(GLenum target, GLdouble *v);
alias PFNGLMULTITEXCOORD4FPROC = void function(GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q);
alias PFNGLMULTITEXCOORD4FVPROC = void function(GLenum target, GLfloat *v);
alias PFNGLMULTITEXCOORD4IPROC = void function(GLenum target, GLint s, GLint t, GLint r, GLint q);
alias PFNGLMULTITEXCOORD4IVPROC = void function(GLenum target, GLint *v);
alias PFNGLMULTITEXCOORD4SPROC = void function(GLenum target, GLshort s, GLshort t, GLshort r, GLshort q);
alias PFNGLMULTITEXCOORD4SVPROC = void function(GLenum target, GLshort *v);
alias PFNGLLOADTRANSPOSEMATRIXFPROC = void function(GLfloat *m);
alias PFNGLLOADTRANSPOSEMATRIXDPROC = void function(GLdouble *m);
alias PFNGLMULTTRANSPOSEMATRIXFPROC = void function(GLfloat *m);
alias PFNGLMULTTRANSPOSEMATRIXDPROC = void function(GLdouble *m);
alias PFNGLSAMPLECOVERAGEPROC = void function(GLclampf value, GLboolean invert);
alias PFNGLCOMPRESSEDTEXIMAGE3DPROC = void function(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, GLvoid *data);
alias PFNGLCOMPRESSEDTEXIMAGE2DPROC = void function(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, GLvoid *data);
alias PFNGLCOMPRESSEDTEXIMAGE1DPROC = void function(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, GLvoid *data);
alias PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC = void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, GLvoid *data);
alias PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC = void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, GLvoid *data);
alias PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC = void function(GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, GLvoid *data);
alias PFNGLGETCOMPRESSEDTEXIMAGEPROC = void function(GLenum target, GLint level, void *img);

/* OpenGL 1.4 */
alias PFNGLFOGCOORDFPROC = void function(GLfloat coord);
alias PFNGLFOGCOORDFVPROC = void function(GLfloat *coord);
alias PFNGLFOGCOORDDPROC = void function(GLdouble coord);
alias PFNGLFOGCOORDDVPROC = void function(GLdouble *coord);
alias PFNGLFOGCOORDPOINTERPROC = void function(GLenum type, GLsizei stride, GLvoid *pointer);
alias PFNGLMULTIDRAWARRAYSPROC = void function(GLenum mode, GLint *first, GLsizei *count, GLsizei primcount);
alias PFNGLMULTIDRAWELEMENTSPROC = void function(GLenum mode, GLsizei *count, GLenum type, GLvoid **indices, GLsizei primcount);
alias PFNGLPOINTPARAMETERFPROC = void function(GLenum pname, GLfloat param);
alias PFNGLPOINTPARAMETERFVPROC = void function(GLenum pname, GLfloat *params);
alias PFNGLSECONDARYCOLOR3BPROC = void function(GLbyte red, GLbyte green, GLbyte blue);
alias PFNGLSECONDARYCOLOR3BVPROC = void function(GLbyte *v);
alias PFNGLSECONDARYCOLOR3DPROC = void function(GLdouble red, GLdouble green, GLdouble blue);
alias PFNGLSECONDARYCOLOR3DVPROC = void function(GLdouble *v);
alias PFNGLSECONDARYCOLOR3FPROC = void function(GLfloat red, GLfloat green, GLfloat blue);
alias PFNGLSECONDARYCOLOR3FVPROC = void function(GLfloat *v);
alias PFNGLSECONDARYCOLOR3IPROC = void function(GLint red, GLint green, GLint blue);
alias PFNGLSECONDARYCOLOR3IVPROC = void function(GLint *v);
alias PFNGLSECONDARYCOLOR3SPROC = void function(GLshort red, GLshort green, GLshort blue);
alias PFNGLSECONDARYCOLOR3SVPROC = void function(GLshort *v);
alias PFNGLSECONDARYCOLOR3UBPROC = void function(GLubyte red, GLubyte green, GLubyte blue);
alias PFNGLSECONDARYCOLOR3UBVPROC = void function(GLubyte *v);
alias PFNGLSECONDARYCOLOR3UIPROC = void function(GLuint red, GLuint green, GLuint blue);
alias PFNGLSECONDARYCOLOR3UIVPROC = void function(GLuint *v);
alias PFNGLSECONDARYCOLOR3USPROC = void function(GLushort red, GLushort green, GLushort blue);
alias PFNGLSECONDARYCOLOR3USVPROC = void function(GLushort *v);
alias PFNGLSECONDARYCOLORPOINTERPROC = void function(GLint size, GLenum type, GLsizei stride, GLvoid *pointer);
alias PFNGLBLENDFUNCSEPARATEPROC = void function(GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
alias PFNGLWINDOWPOS2DPROC = void function(GLdouble x, GLdouble y);
alias PFNGLWINDOWPOS2FPROC = void function(GLfloat x, GLfloat y);
alias PFNGLWINDOWPOS2IPROC = void function(GLint x, GLint y);
alias PFNGLWINDOWPOS2SPROC = void function(GLshort x, GLshort y);
alias PFNGLWINDOWPOS2DVPROC = void function(GLdouble *p);
alias PFNGLWINDOWPOS2FVPROC = void function(GLfloat *p);
alias PFNGLWINDOWPOS2IVPROC = void function(GLint *p);
alias PFNGLWINDOWPOS2SVPROC = void function(GLshort *p);
alias PFNGLWINDOWPOS3DPROC = void function(GLdouble x, GLdouble y, GLdouble z);
alias PFNGLWINDOWPOS3FPROC = void function(GLfloat x, GLfloat y, GLfloat z);
alias PFNGLWINDOWPOS3IPROC = void function(GLint x, GLint y, GLint z);
alias PFNGLWINDOWPOS3SPROC = void function(GLshort x, GLshort y, GLshort z);
alias PFNGLWINDOWPOS3DVPROC = void function(GLdouble *p);
alias PFNGLWINDOWPOS3FVPROC = void function(GLfloat *p);
alias PFNGLWINDOWPOS3IVPROC = void function(GLint *p);
alias PFNGLWINDOWPOS3SVPROC = void function(GLshort *p);



/************************************************************************
 *
 * Extension Constants
 *
 * Note: Proper OpenGL extension checking must be performed to use these.
 *
 ************************************************************************/

/*-----------------------------------------------------------------------
 * ARB
 *----------------------------------------------------------------------*/

enum uint GL_ARB_depth_texture = 1;
enum uint GL_DEPTH_COMPONENT16_ARB          = 0x81A5;
enum uint GL_DEPTH_COMPONENT24_ARB          = 0x81A6;
enum uint GL_DEPTH_COMPONENT32_ARB          = 0x81A7;
enum uint GL_TEXTURE_DEPTH_SIZE_ARB         = 0x884A;
enum uint GL_DEPTH_TEXTURE_MODE_ARB         = 0x884B;

enum uint GL_ARB_fragment_program = 1;
enum uint GL_FRAGMENT_PROGRAM_ARB                     = 0x8804;
enum uint GL_PROGRAM_ALU_INSTRUCTIONS_ARB             = 0x8805;
enum uint GL_PROGRAM_TEX_INSTRUCTIONS_ARB             = 0x8806;
enum uint GL_PROGRAM_TEX_INDIRECTIONS_ARB             = 0x8807;
enum uint GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB      = 0x8808;
enum uint GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB      = 0x8809;
enum uint GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB      = 0x880A;
enum uint GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB         = 0x880B;
enum uint GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB         = 0x880C;
enum uint GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB         = 0x880D;
enum uint GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB  = 0x880E;
enum uint GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB  = 0x880F;
enum uint GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB  = 0x8810;
enum uint GL_MAX_TEXTURE_COORDS_ARB                   = 0x8871;
enum uint GL_MAX_TEXTURE_IMAGE_UNITS_ARB              = 0x8872;

/* OpenGL 1.2 imaging subset */
enum uint GL_ARB_imaging = 1;
enum uint GL_CONSTANT_COLOR                 = 0x8001;
enum uint GL_ONE_MINUS_CONSTANT_COLOR       = 0x8002;
enum uint GL_CONSTANT_ALPHA                 = 0x8003;
enum uint GL_ONE_MINUS_CONSTANT_ALPHA       = 0x8004;
enum uint GL_BLEND_COLOR                    = 0x8005;
enum uint GL_FUNC_ADD                       = 0x8006;
enum uint GL_MIN                            = 0x8007;
enum uint GL_MAX                            = 0x8008;
enum uint GL_BLEND_EQUATION                 = 0x8009;
enum uint GL_FUNC_SUBTRACT                  = 0x800A;
enum uint GL_FUNC_REVERSE_SUBTRACT          = 0x800B;
enum uint GL_CONVOLUTION_1D                 = 0x8010;
enum uint GL_CONVOLUTION_2D                 = 0x8011;
enum uint GL_SEPARABLE_2D                   = 0x8012;
enum uint GL_CONVOLUTION_BORDER_MODE        = 0x8013;
enum uint GL_CONVOLUTION_FILTER_SCALE       = 0x8014;
enum uint GL_CONVOLUTION_FILTER_BIAS        = 0x8015;
enum uint GL_REDUCE                         = 0x8016;
enum uint GL_CONVOLUTION_FORMAT             = 0x8017;
enum uint GL_CONVOLUTION_WIDTH              = 0x8018;
enum uint GL_CONVOLUTION_HEIGHT             = 0x8019;
enum uint GL_MAX_CONVOLUTION_WIDTH          = 0x801A;
enum uint GL_MAX_CONVOLUTION_HEIGHT         = 0x801B;
enum uint GL_POST_CONVOLUTION_RED_SCALE     = 0x801C;
enum uint GL_POST_CONVOLUTION_GREEN_SCALE   = 0x801D;
enum uint GL_POST_CONVOLUTION_BLUE_SCALE    = 0x801E;
enum uint GL_POST_CONVOLUTION_ALPHA_SCALE   = 0x801F;
enum uint GL_POST_CONVOLUTION_RED_BIAS      = 0x8020;
enum uint GL_POST_CONVOLUTION_GREEN_BIAS    = 0x8021;
enum uint GL_POST_CONVOLUTION_BLUE_BIAS     = 0x8022;
enum uint GL_POST_CONVOLUTION_ALPHA_BIAS    = 0x8023;
enum uint GL_HISTOGRAM                      = 0x8024;
enum uint GL_PROXY_HISTOGRAM                = 0x8025;
enum uint GL_HISTOGRAM_WIDTH                = 0x8026;
enum uint GL_HISTOGRAM_FORMAT               = 0x8027;
enum uint GL_HISTOGRAM_RED_SIZE             = 0x8028;
enum uint GL_HISTOGRAM_GREEN_SIZE           = 0x8029;
enum uint GL_HISTOGRAM_BLUE_SIZE            = 0x802A;
enum uint GL_HISTOGRAM_ALPHA_SIZE           = 0x802B;
enum uint GL_HISTOGRAM_LUMINANCE_SIZE       = 0x802C;
enum uint GL_HISTOGRAM_SINK                 = 0x802D;
enum uint GL_MINMAX                         = 0x802E;
enum uint GL_MINMAX_FORMAT                  = 0x802F;
enum uint GL_MINMAX_SINK                    = 0x8030;
enum uint GL_TABLE_TOO_LARGE                = 0x8031;
enum uint GL_COLOR_MATRIX                   = 0x80B1;
enum uint GL_COLOR_MATRIX_STACK_DEPTH       = 0x80B2;
enum uint GL_MAX_COLOR_MATRIX_STACK_DEPTH   = 0x80B3;
enum uint GL_POST_COLOR_MATRIX_RED_SCALE    = 0x80B4;
enum uint GL_POST_COLOR_MATRIX_GREEN_SCALE  = 0x80B5;
enum uint GL_POST_COLOR_MATRIX_BLUE_SCALE   = 0x80B6;
enum uint GL_POST_COLOR_MATRIX_ALPHA_SCALE  = 0x80B7;
enum uint GL_POST_COLOR_MATRIX_RED_BIAS     = 0x80B8;
enum uint GL_POST_COLOR_MATRIX_GREEN_BIAS   = 0x80B9;
enum uint GL_POST_COLOR_MATRIX_BLUE_BIAS    = 0x80BA;
enum uint GL_POST_COLOR_MATIX_ALPHA_BIAS    = 0x80BB;
enum uint GL_COLOR_TABLE                    = 0x80D0;
enum uint GL_POST_CONVOLUTION_COLOR_TABLE   = 0x80D1;
enum uint GL_POST_COLOR_MATRIX_COLOR_TABLE  = 0x80D2;
enum uint GL_PROXY_COLOR_TABLE              = 0x80D3;
enum uint GL_PROXY_POST_CONVOLUTION_COLOR_TABLE = 0x80D4;
enum uint GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE = 0x80D5;
enum uint GL_COLOR_TABLE_SCALE              = 0x80D6;
enum uint GL_COLOR_TABLE_BIAS               = 0x80D7;
enum uint GL_COLOR_TABLE_FORMAT             = 0x80D8;
enum uint GL_COLOR_TABLE_WIDTH              = 0x80D9;
enum uint GL_COLOR_TABLE_RED_SIZE           = 0x80DA;
enum uint GL_COLOR_TABLE_GREEN_SIZE         = 0x80DB;
enum uint GL_COLOR_TABLE_BLUE_SIZE          = 0x80DC;
enum uint GL_COLOR_TABLE_ALPHA_SIZE         = 0x80DD;
enum uint GL_COLOR_TABLE_LUMINANCE_SIZE     = 0x80DE;
enum uint GL_COLOR_TABLE_INTENSITY_SIZE     = 0x80DF;
enum uint GL_IGNORE_BORDER                  = 0x8150;
enum uint GL_CONSTANT_BORDER                = 0x8151;
enum uint GL_WRAP_BORDER                    = 0x8152;
enum uint GL_REPLICATE_BORDER               = 0x8153;
enum uint GL_CONVOLUTION_BORDER_COLOR       = 0x8154;

enum uint GL_ARB_matrix_palette = 1;
enum uint GL_MATRIX_PALETTE_ARB             = 0x8840;
enum uint GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB = 0x8841;
enum uint GL_MAX_PALETTE_MATRICES_ARB       = 0x8842;
enum uint GL_CURRENT_PALETTE_MATRIX_ARB     = 0x8843;
enum uint GL_MATRIX_INDEX_ARRAY_ARB         = 0x8844;
enum uint GL_CURRENT_MATRIX_INDEX_ARB       = 0x8845;
enum uint GL_MATRIX_INDEX_ARRAY_SIZE_ARB    = 0x8846;
enum uint GL_MATRIX_INDEX_ARRAY_TYPE_ARB    = 0x8847;
enum uint GL_MATRIX_INDEX_ARRAY_STRIDE_ARB  = 0x8848;
enum uint GL_MATRIX_INDEX_ARRAY_POINTER_ARB = 0x8849;

enum uint GL_ARB_multisample = 1;
enum uint GL_MULTISAMPLE_ARB                = 0x809D;
enum uint GL_SAMPLE_ALPHA_TO_COVERAGE_ARB   = 0x809E;
enum uint GL_SAMPLE_ALPHA_TO_ONE_ARB        = 0x809F;
enum uint GL_SAMPLE_COVERAGE_ARB            = 0x80A0;
enum uint GL_SAMPLE_BUFFERS_ARB             = 0x80A8;
enum uint GL_SAMPLES_ARB                    = 0x80A9;
enum uint GL_SAMPLE_COVERAGE_VALUE_ARB      = 0x80AA;
enum uint GL_SAMPLE_COVERAGE_INVERT_ARB     = 0x80AB;
enum uint GL_MULTISAMPLE_BIT_ARB            = 0x20000000;

enum uint GL_ARB_multitexture = 1;
enum uint GL_TEXTURE0_ARB                   = 0x84C0;
enum uint GL_TEXTURE1_ARB                   = 0x84C1;
enum uint GL_TEXTURE2_ARB                   = 0x84C2;
enum uint GL_TEXTURE3_ARB                   = 0x84C3;
enum uint GL_TEXTURE4_ARB                   = 0x84C4;
enum uint GL_TEXTURE5_ARB                   = 0x84C5;
enum uint GL_TEXTURE6_ARB                   = 0x84C6;
enum uint GL_TEXTURE7_ARB                   = 0x84C7;
enum uint GL_TEXTURE8_ARB                   = 0x84C8;
enum uint GL_TEXTURE9_ARB                   = 0x84C9;
enum uint GL_TEXTURE10_ARB                  = 0x84CA;
enum uint GL_TEXTURE11_ARB                  = 0x84CB;
enum uint GL_TEXTURE12_ARB                  = 0x84CC;
enum uint GL_TEXTURE13_ARB                  = 0x84CD;
enum uint GL_TEXTURE14_ARB                  = 0x84CE;
enum uint GL_TEXTURE15_ARB                  = 0x84CF;
enum uint GL_TEXTURE16_ARB                  = 0x84D0;
enum uint GL_TEXTURE17_ARB                  = 0x84D1;
enum uint GL_TEXTURE18_ARB                  = 0x84D2;
enum uint GL_TEXTURE19_ARB                  = 0x84D3;
enum uint GL_TEXTURE20_ARB                  = 0x84D4;
enum uint GL_TEXTURE21_ARB                  = 0x84D5;
enum uint GL_TEXTURE22_ARB                  = 0x84D6;
enum uint GL_TEXTURE23_ARB                  = 0x84D7;
enum uint GL_TEXTURE24_ARB                  = 0x84D8;
enum uint GL_TEXTURE25_ARB                  = 0x84D9;
enum uint GL_TEXTURE26_ARB                  = 0x84DA;
enum uint GL_TEXTURE27_ARB                  = 0x84DB;
enum uint GL_TEXTURE28_ARB                  = 0x84DC;
enum uint GL_TEXTURE29_ARB                  = 0x84DD;
enum uint GL_TEXTURE30_ARB                  = 0x84DE;
enum uint GL_TEXTURE31_ARB                  = 0x84DF;
enum uint GL_ACTIVE_TEXTURE_ARB             = 0x84E0;
enum uint GL_CLIENT_ACTIVE_TEXTURE_ARB      = 0x84E1;
enum uint GL_MAX_TEXTURE_UNITS_ARB          = 0x84E2;

enum uint GL_ARB_point_parameters = 1;
enum uint GL_POINT_SIZE_MIN_ARB             = 0x8126;
enum uint GL_POINT_SIZE_MIN_EXT             = 0x8126;
enum uint GL_POINT_SIZE_MIN_SGIS            = 0x8126;
enum uint GL_POINT_SIZE_MAX_ARB             = 0x8127;
enum uint GL_POINT_SIZE_MAX_EXT             = 0x8127;
enum uint GL_POINT_SIZE_MAX_SGIS            = 0x8127;
enum uint GL_POINT_FADE_THRESHOLD_SIZE_ARB  = 0x8128;
enum uint GL_POINT_FADE_THRESHOLD_SIZE_EXT  = 0x8128;
enum uint GL_POINT_FADE_THRESHOLD_SIZE_SGIS = 0x8128;
enum uint GL_POINT_DISTANCE_ATTENUATION_ARB = 0x8129;
enum uint GL_DISTANCE_ATTENUATION_EXT       = 0x8129;
enum uint GL_DISTANCE_ATTENUATION_SGIS      = 0x8129;

enum uint GL_ARB_shadow = 1;
enum uint GL_TEXTURE_COMPARE_MODE_ARB       = 0x884C;
enum uint GL_TEXTURE_COMPARE_FUNC_ARB       = 0x884D;
enum uint GL_COMPARE_R_TO_TEXTURE_ARB       = 0x884E;

enum uint GL_ARB_shadow_ambient = 1;
enum uint GL_TEXTURE_COMPARE_FAIL_VALUE_ARB = 0x80BF;

enum uint GL_ARB_texture_border_clamp = 1;
enum uint GL_CLAMP_TO_BORDER_ARB            = 0x812D;

enum uint GL_ARB_texture_compression = 1;
enum uint GL_COMPRESSED_ALPHA_ARB           = 0x84E9;
enum uint GL_COMPRESSED_LUMINANCE_ARB       = 0x84EA;
enum uint GL_COMPRESSED_LUMINANCE_ALPHA_ARB = 0x84EB;
enum uint GL_COMPRESSED_INTENSITY_ARB       = 0x84EC;
enum uint GL_COMPRESSED_RGB_ARB             = 0x84ED;
enum uint GL_COMPRESSED_RGBA_ARB            = 0x84EE;
enum uint GL_TEXTURE_COMPRESSION_HINT_ARB   = 0x84EF;
enum uint GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB = 0x86A0;
enum uint GL_TEXTURE_COMPRESSED_ARB         = 0x86A1;
enum uint GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB = 0x86A2;
enum uint GL_COMPRESSED_TEXTURE_FORMATS_ARB = 0x86A3;

enum uint GL_ARB_texture_cube_map = 1;
enum uint GL_NORMAL_MAP_ARB                 = 0x8511;
enum uint GL_REFLECTION_MAP_ARB             = 0x8512;
enum uint GL_TEXTURE_CUBE_MAP_ARB           = 0x8513;
enum uint GL_TEXTURE_BINDING_CUBE_MAP_ARB   = 0x8514;
enum uint GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB = 0x8515;
enum uint GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB = 0x8516;
enum uint GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB = 0x8517;
enum uint GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB = 0x8518;
enum uint GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB = 0x8519;
enum uint GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB = 0x851A;
enum uint GL_PROXY_TEXTURE_CUBE_MAP_ARB     = 0x851B;
enum uint GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB  = 0x851C;

enum uint GL_ARB_texture_env_add = 1;

enum uint GL_ARB_texture_env_combine = 1;
enum uint GL_COMBINE_ARB                    = 0x8570;
enum uint GL_COMBINE_RGB_ARB                = 0x8571;
enum uint GL_COMBINE_ALPHA_ARB              = 0x8572;
enum uint GL_SOURCE0_RGB_ARB                = 0x8580;
enum uint GL_SOURCE1_RGB_ARB                = 0x8581;
enum uint GL_SOURCE2_RGB_ARB                = 0x8582;
enum uint GL_SOURCE0_ALPHA_ARB              = 0x8588;
enum uint GL_SOURCE1_ALPHA_ARB              = 0x8589;
enum uint GL_SOURCE2_ALPHA_ARB              = 0x858A;
enum uint GL_OPERAND0_RGB_ARB               = 0x8590;
enum uint GL_OPERAND1_RGB_ARB               = 0x8591;
enum uint GL_OPERAND2_RGB_ARB               = 0x8592;
enum uint GL_OPERAND0_ALPHA_ARB             = 0x8598;
enum uint GL_OPERAND1_ALPHA_ARB             = 0x8599;
enum uint GL_OPERAND2_ALPHA_ARB             = 0x859A;
enum uint GL_RGB_SCALE_ARB                  = 0x8573;
enum uint GL_ADD_SIGNED_ARB                 = 0x8574;
enum uint GL_INTERPOLATE_ARB                = 0x8575;
enum uint GL_SUBTRACT_ARB                   = 0x84E7;
enum uint GL_CONSTANT_ARB                   = 0x8576;
enum uint GL_PRIMARY_COLOR_ARB              = 0x8577;
enum uint GL_PREVIOUS_ARB                   = 0x8578;

enum uint GL_ARB_texture_env_crossbar = 1;

enum uint GL_ARB_texture_env_dot3 = 1;
enum uint GL_DOT3_RGB_ARB                   = 0x86AE;
enum uint GL_DOT3_RGBA_ARB                  = 0x86AF;

enum uint GL_ARB_texture_mirrored_repeat = 1;
enum uint GL_MIRRORED_REPEAT_ARB            = 0x8370;

enum uint GL_ARB_transpose_matrix = 1;
enum uint GL_TRANSPOSE_MODELVIEW_MATRIX_ARB = 0x84E3;
enum uint GL_TRANSPOSE_PROJECTION_MATRIX_ARB = 0x84E4;
enum uint GL_TRANSPOSE_TEXTURE_MATRIX_ARB   = 0x84E5;
enum uint GL_TRANSPOSE_COLOR_MATRIX_ARB     = 0x84E6;

enum uint GL_ARB_vertex_blend = 1;
enum uint GL_MAX_VERTEX_UNITS_ARB           = 0x86A4;
enum uint GL_ACTIVE_VERTEX_UNITS_ARB        = 0x86A5;
enum uint GL_WEIGHT_SUM_UNITY_ARB           = 0x86A6;
enum uint GL_VERTEX_BLEND_ARB               = 0x86A7;
enum uint GL_CURRENT_WEIGHT_ARB             = 0x86A8;
enum uint GL_WEIGHT_ARRAY_TYPE_ARB          = 0x86A9;
enum uint GL_WEIGHT_ARRAY_STRIDE_ARB        = 0x86AA;
enum uint GL_WEIGHT_ARRAY_SIZE_ARB          = 0x86AB;
enum uint GL_WEIGHT_ARRAY_POINTER_ARB       = 0x86AC;
enum uint GL_WEIGHT_ARRAY_ARB               = 0x86AD;
enum uint GL_MODELVIEW0_ARB                 = 0x1700;
enum uint GL_MODELVIEW1_ARB                 = 0x850A;
enum uint GL_MODELVIEW2_ARB                 = 0x8722;
enum uint GL_MODELVIEW3_ARB                 = 0x8723;
enum uint GL_MODELVIEW4_ARB                 = 0x8724;
enum uint GL_MODELVIEW5_ARB                 = 0x8725;
enum uint GL_MODELVIEW6_ARB                 = 0x8726;
enum uint GL_MODELVIEW7_ARB                 = 0x8727;
enum uint GL_MODELVIEW8_ARB                 = 0x8728;
enum uint GL_MODELVIEW9_ARB                 = 0x8729;
enum uint GL_MODELVIEW10_ARB                = 0x872A;
enum uint GL_MODELVIEW11_ARB                = 0x872B;
enum uint GL_MODELVIEW12_ARB                = 0x872C;
enum uint GL_MODELVIEW13_ARB                = 0x872D;
enum uint GL_MODELVIEW14_ARB                = 0x872E;
enum uint GL_MODELVIEW15_ARB                = 0x872F;
enum uint GL_MODELVIEW16_ARB                = 0x8730;
enum uint GL_MODELVIEW17_ARB                = 0x8731;
enum uint GL_MODELVIEW18_ARB                = 0x8732;
enum uint GL_MODELVIEW19_ARB                = 0x8733;
enum uint GL_MODELVIEW20_ARB                = 0x8734;
enum uint GL_MODELVIEW21_ARB                = 0x8735;
enum uint GL_MODELVIEW22_ARB                = 0x8736;
enum uint GL_MODELVIEW23_ARB                = 0x8737;
enum uint GL_MODELVIEW24_ARB                = 0x8738;
enum uint GL_MODELVIEW25_ARB                = 0x8739;
enum uint GL_MODELVIEW26_ARB                = 0x873A;
enum uint GL_MODELVIEW27_ARB                = 0x873B;
enum uint GL_MODELVIEW28_ARB                = 0x873C;
enum uint GL_MODELVIEW29_ARB                = 0x873D;
enum uint GL_MODELVIEW30_ARB                = 0x873E;
enum uint GL_MODELVIEW31_ARB                = 0x873F;

enum uint GL_ARB_vertex_buffer_object = 1;
enum uint GL_ARRAY_BUFFER_ARB               = 0x8892;
enum uint GL_ELEMENT_ARRAY_BUFFER_ARB       = 0x8893;
enum uint GL_ARRAY_BUFFER_BINDING_ARB       = 0x8894;
enum uint GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB = 0x8895;
enum uint GL_VERTEX_ARRAY_BUFFER_BINDING_ARB = 0x8896;
enum uint GL_NORMAL_ARRAY_BUFFER_BINDING_ARB = 0x8897;
enum uint GL_COLOR_ARRAY_BUFFER_BINDING_ARB = 0x8898;
enum uint GL_INDEX_ARRAY_BUFFER_BINDING_ARB = 0x8899;
enum uint GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB = 0x889A;
enum uint GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB = 0x889B;
enum uint GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB = 0x889C;
enum uint GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB = 0x889D;
enum uint GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB = 0x889E;
enum uint GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB = 0x889F;
enum uint GL_STREAM_DRAW_ARB                = 0x88E0;
enum uint GL_STREAM_READ_ARB                = 0x88E1;
enum uint GL_STREAM_COPY_ARB                = 0x88E2;
enum uint GL_STATIC_DRAW_ARB                = 0x88E4;
enum uint GL_STATIC_READ_ARB                = 0x88E5;
enum uint GL_STATIC_COPY_ARB                = 0x88E6;
enum uint GL_DYNAMIC_DRAW_ARB               = 0x88E8;
enum uint GL_DYNAMIC_READ_ARB               = 0x88E9;
enum uint GL_DYNAMIC_COPY_ARB               = 0x88EA;
enum uint GL_READ_ONLY_ARB                  = 0x88B8;
enum uint GL_WRITE_ONLY_ARB                 = 0x88B9;
enum uint GL_READ_WRITE_ARB                 = 0x88BA;
enum uint GL_BUFFER_SIZE_ARB                = 0x8764;
enum uint GL_BUFFER_USAGE_ARB               = 0x8765;
enum uint GL_BUFFER_ACCESS_ARB              = 0x88BB;
enum uint GL_BUFFER_MAPPED_ARB              = 0x88BC;
enum uint GL_BUFFER_MAP_POINTER_ARB         = 0x88BD;

enum uint GL_ARB_vertex_program = 1;
enum uint GL_VERTEX_PROGRAM_ARB                       = 0x8620;
enum uint GL_VERTEX_PROGRAM_POINT_SIZE_ARB            = 0x8642;
enum uint GL_VERTEX_PROGRAM_TWO_SIDE_ARB              = 0x8643;
enum uint GL_COLOR_SUM_ARB                            = 0x8458;
enum uint GL_PROGRAM_FORMAT_ASCII_ARB                 = 0x8875;
enum uint GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB          = 0x8622;
enum uint GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB             = 0x8623;
enum uint GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB           = 0x8624;
enum uint GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB             = 0x8625;
enum uint GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB       = 0x886A;
enum uint GL_CURRENT_VERTEX_ATTRIB_ARB                = 0x8626;
enum uint GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB          = 0x8645;
enum uint GL_PROGRAM_LENGTH_ARB                       = 0x8627;
enum uint GL_PROGRAM_FORMAT_ARB                       = 0x8876;
enum uint GL_PROGRAM_BINDING_ARB                      = 0x8677;
enum uint GL_PROGRAM_INSTRUCTIONS_ARB                 = 0x88A0;
enum uint GL_MAX_PROGRAM_INSTRUCTIONS_ARB             = 0x88A1;
enum uint GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB          = 0x88A2;
enum uint GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB      = 0x88A3;
enum uint GL_PROGRAM_TEMPORARIES_ARB                  = 0x88A4;
enum uint GL_MAX_PROGRAM_TEMPORARIES_ARB              = 0x88A5;
enum uint GL_PROGRAM_NATIVE_TEMPORARIES_ARB           = 0x88A6;
enum uint GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB       = 0x88A7;
enum uint GL_PROGRAM_PARAMETERS_ARB                   = 0x88A8;
enum uint GL_MAX_PROGRAM_PARAMETERS_ARB               = 0x88A9;
enum uint GL_PROGRAM_NATIVE_PARAMETERS_ARB            = 0x88AA;
enum uint GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB        = 0x88AB;
enum uint GL_PROGRAM_ATTRIBS_ARB                      = 0x88AC;
enum uint GL_MAX_PROGRAM_ATTRIBS_ARB                  = 0x88AD;
enum uint GL_PROGRAM_NATIVE_ATTRIBS_ARB               = 0x88AE;
enum uint GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB           = 0x88AF;
enum uint GL_PROGRAM_ADDRESS_REGISTERS_ARB            = 0x88B0;
enum uint GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB        = 0x88B1;
enum uint GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB     = 0x88B2;
enum uint GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB = 0x88B3;
enum uint GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB         = 0x88B4;
enum uint GL_MAX_PROGRAM_ENV_PARAMETERS_ARB           = 0x88B5;
enum uint GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB          = 0x88B6;
enum uint GL_PROGRAM_STRING_ARB                       = 0x8628;
enum uint GL_PROGRAM_ERROR_POSITION_ARB               = 0x864B;
enum uint GL_CURRENT_MATRIX_ARB                       = 0x8641;
enum uint GL_TRANSPOSE_CURRENT_MATRIX_ARB             = 0x88B7;
enum uint GL_CURRENT_MATRIX_STACK_DEPTH_ARB           = 0x8640;
enum uint GL_MAX_VERTEX_ATTRIBS_ARB                   = 0x8869;
enum uint GL_MAX_PROGRAM_MATRICES_ARB                 = 0x862F;
enum uint GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB       = 0x862E;
enum uint GL_PROGRAM_ERROR_STRING_ARB                 = 0x8874;
enum uint GL_MATRIX0_ARB                              = 0x88C0;
enum uint GL_MATRIX1_ARB                              = 0x88C1;
enum uint GL_MATRIX2_ARB                              = 0x88C2;
enum uint GL_MATRIX3_ARB                              = 0x88C3;
enum uint GL_MATRIX4_ARB                              = 0x88C4;
enum uint GL_MATRIX5_ARB                              = 0x88C5;
enum uint GL_MATRIX6_ARB                              = 0x88C6;
enum uint GL_MATRIX7_ARB                              = 0x88C7;
enum uint GL_MATRIX8_ARB                              = 0x88C8;
enum uint GL_MATRIX9_ARB                              = 0x88C9;
enum uint GL_MATRIX10_ARB                             = 0x88CA;
enum uint GL_MATRIX11_ARB                             = 0x88CB;
enum uint GL_MATRIX12_ARB                             = 0x88CC;
enum uint GL_MATRIX13_ARB                             = 0x88CD;
enum uint GL_MATRIX14_ARB                             = 0x88CE;
enum uint GL_MATRIX15_ARB                             = 0x88CF;
enum uint GL_MATRIX16_ARB                             = 0x88D0;
enum uint GL_MATRIX17_ARB                             = 0x88D1;
enum uint GL_MATRIX18_ARB                             = 0x88D2;
enum uint GL_MATRIX19_ARB                             = 0x88D3;
enum uint GL_MATRIX20_ARB                             = 0x88D4;
enum uint GL_MATRIX21_ARB                             = 0x88D5;
enum uint GL_MATRIX22_ARB                             = 0x88D6;
enum uint GL_MATRIX23_ARB                             = 0x88D7;
enum uint GL_MATRIX24_ARB                             = 0x88D8;
enum uint GL_MATRIX25_ARB                             = 0x88D9;
enum uint GL_MATRIX26_ARB                             = 0x88DA;
enum uint GL_MATRIX27_ARB                             = 0x88DB;
enum uint GL_MATRIX28_ARB                             = 0x88DC;
enum uint GL_MATRIX29_ARB                             = 0x88DD;
enum uint GL_MATRIX30_ARB                             = 0x88DE;
enum uint GL_MATRIX31_ARB                             = 0x88DF;

enum uint GL_ARB_window_pos = 1;



/*-----------------------------------------------------------------------
 * EXT
 *----------------------------------------------------------------------*/

enum uint GL_EXT_422_pixels = 1;
enum uint GL_422_EXT                        = 0x80CC;
enum uint GL_422_REV_EXT                    = 0x80CD;
enum uint GL_422_AVERAGE_EXT                = 0x80CE;
enum uint GL_422_REV_AVERAGE_EXT            = 0x80CF;

enum uint GL_EXT_abgr = 1;
enum uint GL_ABGR_EXT                       = 0x8000;

enum uint GL_EXT_bgra = 1;
enum uint GL_BGR_EXT                        = 0x80E0;
enum uint GL_BGRA_EXT                       = 0x80E1;

enum uint GL_EXT_blend_color = 1;
enum uint GL_CONSTANT_COLOR_EXT             = 0x8001;
enum uint GL_ONE_MINUS_CONSTANT_COLOR_EXT   = 0x8002;
enum uint GL_CONSTANT_ALPHA_EXT             = 0x8003;
enum uint GL_ONE_MINUS_CONSTANT_ALPHA_EXT   = 0x8004;
enum uint GL_BLEND_COLOR_EXT                = 0x8005;

enum uint GL_EXT_blend_func_separate = 1;
enum uint GL_BLEND_DST_RGB_EXT              = 0x80C8;
enum uint GL_BLEND_SRC_RGB_EXT              = 0x80C9;
enum uint GL_BLEND_DST_ALPHA_EXT            = 0x80CA;
enum uint GL_BLEND_SRC_ALPHA_EXT            = 0x80CB;

enum uint GL_EXT_blend_logic_op = 1;

enum uint GL_EXT_blend_minmax = 1;
enum uint GL_FUNC_ADD_EXT                   = 0x8006;
enum uint GL_MIN_EXT                        = 0x8007;
enum uint GL_MAX_EXT                        = 0x8008;
enum uint GL_BLEND_EQUATION_EXT             = 0x8009;

enum uint GL_EXT_blend_subtract = 1;
enum uint GL_FUNC_SUBTRACT_EXT              = 0x800A;
enum uint GL_FUNC_REVERSE_SUBTRACT_EXT      = 0x800B;

enum uint GL_EXT_clip_volume_hint = 1;
enum uint GL_CLIP_VOLUME_CLIPPING_HINT_EXT  = 0x80F0;

enum uint GL_EXT_cmyka = 1;
enum uint GL_CMYK_EXT                       = 0x800C;
enum uint GL_CMYKA_EXT                      = 0x800D;
enum uint GL_PACK_CMYK_HINT_EXT             = 0x800E;
enum uint GL_UNPACK_CMYK_HINT_EXT           = 0x800F;

enum uint GL_EXT_color_subtable = 1;

enum uint GL_EXT_compiled_vertex_array = 1;
enum uint GL_ARRAY_ELEMENT_LOCK_FIRST_EXT   = 0x81A8;
enum uint GL_ARRAY_ELEMENT_LOCK_COUNT_EXT   = 0x81A9;

enum uint GL_EXT_convolution = 1;
enum uint GL_CONVOLUTION_1D_EXT             = 0x8010;
enum uint GL_CONVOLUTION_2D_EXT             = 0x8011;
enum uint GL_SEPARABLE_2D_EXT               = 0x8012;
enum uint GL_CONVOLUTION_BORDER_MODE_EXT    = 0x8013;
enum uint GL_CONVOLUTION_FILTER_SCALE_EXT   = 0x8014;
enum uint GL_CONVOLUTION_FILTER_BIAS_EXT    = 0x8015;
enum uint GL_REDUCE_EXT                     = 0x8016;
enum uint GL_CONVOLUTION_FORMAT_EXT         = 0x8017;
enum uint GL_CONVOLUTION_WIDTH_EXT          = 0x8018;
enum uint GL_CONVOLUTION_HEIGHT_EXT         = 0x8019;
enum uint GL_MAX_CONVOLUTION_WIDTH_EXT      = 0x801A;
enum uint GL_MAX_CONVOLUTION_HEIGHT_EXT     = 0x801B;
enum uint GL_POST_CONVOLUTION_RED_SCALE_EXT = 0x801C;
enum uint GL_POST_CONVOLUTION_GREEN_SCALE_EXT = 0x801D;
enum uint GL_POST_CONVOLUTION_BLUE_SCALE_EXT = 0x801E;
enum uint GL_POST_CONVOLUTION_ALPHA_SCALE_EXT = 0x801F;
enum uint GL_POST_CONVOLUTION_RED_BIAS_EXT  = 0x8020;
enum uint GL_POST_CONVOLUTION_GREEN_BIAS_EXT = 0x8021;
enum uint GL_POST_CONVOLUTION_BLUE_BIAS_EXT = 0x8022;
enum uint GL_POST_CONVOLUTION_ALPHA_BIAS_EXT = 0x8023;

enum uint GL_EXT_coordinate_frame = 1;
enum uint GL_TANGENT_ARRAY_EXT              = 0x8439;
enum uint GL_BINORMAL_ARRAY_EXT             = 0x843A;
enum uint GL_CURRENT_TANGENT_EXT            = 0x843B;
enum uint GL_CURRENT_BINORMAL_EXT           = 0x843C;
enum uint GL_TANGENT_ARRAY_TYPE_EXT         = 0x843E;
enum uint GL_TANGENT_ARRAY_STRIDE_EXT       = 0x843F;
enum uint GL_BINORMAL_ARRAY_TYPE_EXT        = 0x8440;
enum uint GL_BINORMAL_ARRAY_STRIDE_EXT      = 0x8441;
enum uint GL_TANGENT_ARRAY_POINTER_EXT      = 0x8442;
enum uint GL_BINORMAL_ARRAY_POINTER_EXT     = 0x8443;
enum uint GL_MAP1_TANGENT_EXT               = 0x8444;
enum uint GL_MAP2_TANGENT_EXT               = 0x8445;
enum uint GL_MAP1_BINORMAL_EXT              = 0x8446;
enum uint GL_MAP2_BINORMAL_EXT              = 0x8447;

enum uint GL_EXT_copy_texture = 1;

enum uint GL_EXT_cull_vertex = 1;
enum uint GL_CULL_VERTEX_EXT                = 0x81AA;
enum uint GL_CULL_VERTEX_EYE_POSITION_EXT   = 0x81AB;
enum uint GL_CULL_VERTEX_OBJECT_POSITION_EXT = 0x81AC;

enum uint GL_EXT_draw_range_elements = 1;
enum uint GL_MAX_ELEMENTS_VERTICES_EXT      = 0x80E8;
enum uint GL_MAX_ELEMENTS_INDICES_EXT       = 0x80E9;

enum uint GL_EXT_fog_coord = 1;
enum uint GL_FOG_COORDINATE_SOURCE_EXT      = 0x8450;
enum uint GL_FOG_COORDINATE_EXT             = 0x8451;
enum uint GL_FRAGMENT_DEPTH_EXT             = 0x8452;
enum uint GL_CURRENT_FOG_COORDINATE_EXT     = 0x8453;
enum uint GL_FOG_COORDINATE_ARRAY_TYPE_EXT  = 0x8454;
enum uint GL_FOG_COORDINATE_ARRAY_STRIDE_EXT = 0x8455;
enum uint GL_FOG_COORDINATE_ARRAY_POINTER_EXT = 0x8456;
enum uint GL_FOG_COORDINATE_ARRAY_EXT       = 0x8457;

enum uint GL_EXT_histogram = 1;
enum uint GL_HISTOGRAM_EXT                  = 0x8024;
enum uint GL_PROXY_HISTOGRAM_EXT            = 0x8025;
enum uint GL_HISTOGRAM_WIDTH_EXT            = 0x8026;
enum uint GL_HISTOGRAM_FORMAT_EXT           = 0x8027;
enum uint GL_HISTOGRAM_RED_SIZE_EXT         = 0x8028;
enum uint GL_HISTOGRAM_GREEN_SIZE_EXT       = 0x8029;
enum uint GL_HISTOGRAM_BLUE_SIZE_EXT        = 0x802A;
enum uint GL_HISTOGRAM_ALPHA_SIZE_EXT       = 0x802B;
enum uint GL_HISTOGRAM_LUMINANCE_SIZE_EXT   = 0x802C;
enum uint GL_HISTOGRAM_SINK_EXT             = 0x802D;
enum uint GL_MINMAX_EXT                     = 0x802E;
enum uint GL_MINMAX_FORMAT_EXT              = 0x802F;
enum uint GL_MINMAX_SINK_EXT                = 0x8030;
enum uint GL_TABLE_TOO_LARGE_EXT            = 0x8031;

enum uint GL_EXT_index_array_formats = 1;
enum uint GL_IUI_V2F_EXT                    = 0x81AD;
enum uint GL_IUI_V3F_EXT                    = 0x81AE;
enum uint GL_IUI_N3F_V2F_EXT                = 0x81AF;
enum uint GL_IUI_N3F_V3F_EXT                = 0x81B0;
enum uint GL_T2F_IUI_V2F_EXT                = 0x81B1;
enum uint GL_T2F_IUI_V3F_EXT                = 0x81B2;
enum uint GL_T2F_IUI_N3F_V2F_EXT            = 0x81B3;
enum uint GL_T2F_IUI_N3F_V3F_EXT            = 0x81B4;

enum uint GL_EXT_index_func = 1;
enum uint GL_INDEX_TEST_EXT                 = 0x81B5;
enum uint GL_INDEX_TEST_FUNC_EXT            = 0x81B6;
enum uint GL_INDEX_TEST_REF_EXT             = 0x81B7;

enum uint GL_EXT_index_material = 1;
enum uint GL_INDEX_MATERIAL_EXT             = 0x81B8;
enum uint GL_INDEX_MATERIAL_PARAMETER_EXT   = 0x81B9;
enum uint GL_INDEX_MATERIAL_FACE_EXT        = 0x81BA;

enum uint GL_EXT_index_texture = 1;

enum uint GL_EXT_light_texture = 1;
enum uint GL_FRAGMENT_MATERIAL_EXT          = 0x8349;
enum uint GL_FRAGMENT_NORMAL_EXT            = 0x834A;
enum uint GL_FRAGMENT_COLOR_EXT             = 0x834C;
enum uint GL_ATTENUATION_EXT                = 0x834D;
enum uint GL_SHADOW_ATTENUATION_EXT         = 0x834E;
enum uint GL_TEXTURE_APPLICATION_MODE_EXT   = 0x834F;
enum uint GL_TEXTURE_LIGHT_EXT              = 0x8350;
enum uint GL_TEXTURE_MATERIAL_FACE_EXT      = 0x8351;
enum uint GL_TEXTURE_MATERIAL_PARAMETER_EXT = 0x8352;
/* reuse GL_FRAGMENT_DEPTH_EXT */

enum uint GL_EXT_misc_attribute = 1;

enum uint GL_EXT_multi_draw_arrays = 1;

enum uint GL_EXT_multisample = 1;
enum uint GL_MULTISAMPLE_EXT                = 0x809D;
enum uint GL_SAMPLE_ALPHA_TO_MASK_EXT       = 0x809E;
enum uint GL_SAMPLE_ALPHA_TO_ONE_EXT        = 0x809F;
enum uint GL_SAMPLE_MASK_EXT                = 0x80A0;
enum uint GL_1PASS_EXT                      = 0x80A1;
enum uint GL_2PASS_0_EXT                    = 0x80A2;
enum uint GL_2PASS_1_EXT                    = 0x80A3;
enum uint GL_4PASS_0_EXT                    = 0x80A4;
enum uint GL_4PASS_1_EXT                    = 0x80A5;
enum uint GL_4PASS_2_EXT                    = 0x80A6;
enum uint GL_4PASS_3_EXT                    = 0x80A7;
enum uint GL_SAMPLE_BUFFERS_EXT             = 0x80A8;
enum uint GL_SAMPLES_EXT                    = 0x80A9;
enum uint GL_SAMPLE_MASK_VALUE_EXT          = 0x80AA;
enum uint GL_SAMPLE_MASK_INVERT_EXT         = 0x80AB;
enum uint GL_SAMPLE_PATTERN_EXT             = 0x80AC;
enum uint GL_MULTISAMPLE_BIT_EXT            = 0x20000000;

enum uint GL_EXT_packed_pixels = 1;
enum uint GL_UNSIGNED_BYTE_3_3_2_EXT        = 0x8032;
enum uint GL_UNSIGNED_SHORT_4_4_4_4_EXT     = 0x8033;
enum uint GL_UNSIGNED_SHORT_5_5_5_1_EXT     = 0x8034;
enum uint GL_UNSIGNED_INT_8_8_8_8_EXT       = 0x8035;
enum uint GL_UNSIGNED_INT_10_10_10_2_EXT    = 0x8036;

enum uint GL_EXT_paletted_texture = 1;
enum uint GL_COLOR_INDEX1_EXT               = 0x80E2;
enum uint GL_COLOR_INDEX2_EXT               = 0x80E3;
enum uint GL_COLOR_INDEX4_EXT               = 0x80E4;
enum uint GL_COLOR_INDEX8_EXT               = 0x80E5;
enum uint GL_COLOR_INDEX12_EXT              = 0x80E6;
enum uint GL_COLOR_INDEX16_EXT              = 0x80E7;
enum uint GL_TEXTURE_INDEX_SIZE_EXT         = 0x80ED;

enum uint GL_EXT_pixel_transform = 1;
enum uint GL_PIXEL_TRANSFORM_2D_EXT         = 0x8330;
enum uint GL_PIXEL_MAG_FILTER_EXT           = 0x8331;
enum uint GL_PIXEL_MIN_FILTER_EXT           = 0x8332;
enum uint GL_PIXEL_CUBIC_WEIGHT_EXT         = 0x8333;
enum uint GL_CUBIC_EXT                      = 0x8334;
enum uint GL_AVERAGE_EXT                    = 0x8335;
enum uint GL_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = 0x8336;
enum uint GL_MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = 0x8337;
enum uint GL_PIXEL_TRANSFORM_2D_MATRIX_EXT  = 0x8338;

enum uint GL_EXT_pixel_transform_color_table = 1;

enum uint GL_EXT_polygon_offset = 1;
enum uint GL_POLYGON_OFFSET_EXT             = 0x8037;
enum uint GL_POLYGON_OFFSET_FACTOR_EXT      = 0x8038;
enum uint GL_POLYGON_OFFSET_BIAS_EXT        = 0x8039;

enum uint GL_EXT_rescale_normal = 1;
enum uint GL_RESCALE_NORMAL_EXT             = 0x803A;

enum uint GL_EXT_secondary_color = 1;
enum uint GL_COLOR_SUM_EXT                  = 0x8458;
enum uint GL_CURRENT_SECONDARY_COLOR_EXT    = 0x8459;
enum uint GL_SECONDARY_COLOR_ARRAY_SIZE_EXT = 0x845A;
enum uint GL_SECONDARY_COLOR_ARRAY_TYPE_EXT = 0x845B;
enum uint GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT = 0x845C;
enum uint GL_SECONDARY_COLOR_ARRAY_POINTER_EXT = 0x845D;
enum uint GL_SECONDARY_COLOR_ARRAY_EXT      = 0x845E;

enum uint GL_EXT_separate_specular_color = 1;
enum uint GL_LIGHT_MODEL_COLOR_CONTROL_EXT  = 0x81F8;
enum uint GL_SINGLE_COLOR_EXT               = 0x81F9;
enum uint GL_SEPARATE_SPECULAR_COLOR_EXT    = 0x81FA;

enum uint GL_EXT_shadow_funcs = 1;

enum uint GL_EXT_shared_texture_palette = 1;
enum uint GL_SHARED_TEXTURE_PALETTE_EXT     = 0x81FB;

enum uint GL_EXT_stencil_two_side = 1;
enum uint GL_STENCIL_TEST_TWO_SIDE_EXT      = 0x8910;
enum uint GL_ACTIVE_STENCIL_FACE_EXT        = 0x8911;

enum uint GL_EXT_stencil_wrap = 1;
enum uint GL_INCR_WRAP_EXT                  = 0x8507;
enum uint GL_DECR_WRAP_EXT                  = 0x8508;

enum uint GL_EXT_subtexture = 1;

enum uint GL_EXT_texture = 1;
enum uint GL_ALPHA4_EXT                     = 0x803B;
enum uint GL_ALPHA8_EXT                     = 0x803C;
enum uint GL_ALPHA12_EXT                    = 0x803D;
enum uint GL_ALPHA16_EXT                    = 0x803E;
enum uint GL_LUMINANCE4_EXT                 = 0x803F;
enum uint GL_LUMINANCE8_EXT                 = 0x8040;
enum uint GL_LUMINANCE12_EXT                = 0x8041;
enum uint GL_LUMINANCE16_EXT                = 0x8042;
enum uint GL_LUMINANCE4_ALPHA4_EXT          = 0x8043;
enum uint GL_LUMINANCE6_ALPHA2_EXT          = 0x8044;
enum uint GL_LUMINANCE8_ALPHA8_EXT          = 0x8045;
enum uint GL_LUMINANCE12_ALPHA4_EXT         = 0x8046;
enum uint GL_LUMINANCE12_ALPHA12_EXT        = 0x8047;
enum uint GL_LUMINANCE16_ALPHA16_EXT        = 0x8048;
enum uint GL_INTENSITY_EXT                  = 0x8049;
enum uint GL_INTENSITY4_EXT                 = 0x804A;
enum uint GL_INTENSITY8_EXT                 = 0x804B;
enum uint GL_INTENSITY12_EXT                = 0x804C;
enum uint GL_INTENSITY16_EXT                = 0x804D;
enum uint GL_RGB2_EXT                       = 0x804E;
enum uint GL_RGB4_EXT                       = 0x804F;
enum uint GL_RGB5_EXT                       = 0x8050;
enum uint GL_RGB8_EXT                       = 0x8051;
enum uint GL_RGB10_EXT                      = 0x8052;
enum uint GL_RGB12_EXT                      = 0x8053;
enum uint GL_RGB16_EXT                      = 0x8054;
enum uint GL_RGBA2_EXT                      = 0x8055;
enum uint GL_RGBA4_EXT                      = 0x8056;
enum uint GL_RGB5_A1_EXT                    = 0x8057;
enum uint GL_RGBA8_EXT                      = 0x8058;
enum uint GL_RGB10_A2_EXT                   = 0x8059;
enum uint GL_RGBA12_EXT                     = 0x805A;
enum uint GL_RGBA16_EXT                     = 0x805B;
enum uint GL_TEXTURE_RED_SIZE_EXT           = 0x805C;
enum uint GL_TEXTURE_GREEN_SIZE_EXT         = 0x805D;
enum uint GL_TEXTURE_BLUE_SIZE_EXT          = 0x805E;
enum uint GL_TEXTURE_ALPHA_SIZE_EXT         = 0x805F;
enum uint GL_TEXTURE_LUMINANCE_SIZE_EXT     = 0x8060;
enum uint GL_TEXTURE_INTENSITY_SIZE_EXT     = 0x8061;
enum uint GL_REPLACE_EXT                    = 0x8062;
enum uint GL_PROXY_TEXTURE_1D_EXT           = 0x8063;
enum uint GL_PROXY_TEXTURE_2D_EXT           = 0x8064;
enum uint GL_TEXTURE_TOO_LARGE_EXT          = 0x8065;

enum uint GL_EXT_texture_compression_s3tc = 1;
enum uint GL_COMPRESSED_RGB_S3TC_DXT1_EXT   = 0x83F0;
enum uint GL_COMPRESSED_RGBA_S3TC_DXT1_EXT  = 0x83F1;
enum uint GL_COMPRESSED_RGBA_S3TC_DXT3_EXT  = 0x83F2;
enum uint GL_COMPRESSED_RGBA_S3TC_DXT5_EXT  = 0x83F3;

enum uint GL_EXT_texture_cube_map = 1;
enum uint GL_NORMAL_MAP_EXT                 = 0x8511;
enum uint GL_REFLECTION_MAP_EXT             = 0x8512;
enum uint GL_TEXTURE_CUBE_MAP_EXT           = 0x8513;
enum uint GL_TEXTURE_BINDING_CUBE_MAP_EXT   = 0x8514;
enum uint GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT = 0x8515;
enum uint GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT = 0x8516;
enum uint GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT = 0x8517;
enum uint GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT = 0x8518;
enum uint GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT = 0x8519;
enum uint GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT = 0x851A;
enum uint GL_PROXY_TEXTURE_CUBE_MAP_EXT     = 0x851B;
enum uint GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT  = 0x851C;

enum uint GL_EXT_texture_env_add = 1;

enum uint GL_EXT_texture_env_combine = 1;
enum uint GL_COMBINE_EXT                    = 0x8570;
enum uint GL_COMBINE_RGB_EXT                = 0x8571;
enum uint GL_COMBINE_ALPHA_EXT              = 0x8572;
enum uint GL_RGB_SCALE_EXT                  = 0x8573;
enum uint GL_ADD_SIGNED_EXT                 = 0x8574;
enum uint GL_INTERPOLATE_EXT                = 0x8575;
enum uint GL_CONSTANT_EXT                   = 0x8576;
enum uint GL_PRIMARY_COLOR_EXT              = 0x8577;
enum uint GL_PREVIOUS_EXT                   = 0x8578;
enum uint GL_SOURCE0_RGB_EXT                = 0x8580;
enum uint GL_SOURCE1_RGB_EXT                = 0x8581;
enum uint GL_SOURCE2_RGB_EXT                = 0x8582;
enum uint GL_SOURCE0_ALPHA_EXT              = 0x8588;
enum uint GL_SOURCE1_ALPHA_EXT              = 0x8589;
enum uint GL_SOURCE2_ALPHA_EXT              = 0x858A;
enum uint GL_OPERAND0_RGB_EXT               = 0x8590;
enum uint GL_OPERAND1_RGB_EXT               = 0x8591;
enum uint GL_OPERAND2_RGB_EXT               = 0x8592;
enum uint GL_OPERAND0_ALPHA_EXT             = 0x8598;
enum uint GL_OPERAND1_ALPHA_EXT             = 0x8599;
enum uint GL_OPERAND2_ALPHA_EXT             = 0x859A;

enum uint GL_EXT_texture_env_dot3 = 1;
enum uint GL_DOT3_RGB_EXT                   = 0x8740;
enum uint GL_DOT3_RGBA_EXT                  = 0x8741;

enum uint GL_EXT_texture_filter_anisotropic = 1;
enum uint GL_TEXTURE_MAX_ANISOTROPY_EXT     = 0x84FE;
enum uint GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT = 0x84FF;

enum uint GL_EXT_texture_lod_bias = 1;
enum uint GL_MAX_TEXTURE_LOD_BIAS_EXT       = 0x84FD;
enum uint GL_TEXTURE_FILTER_CONTROL_EXT     = 0x8500;
enum uint GL_TEXTURE_LOD_BIAS_EXT           = 0x8501;

enum uint GL_EXT_texture_object = 1;
enum uint GL_TEXTURE_PRIORITY_EXT           = 0x8066;
enum uint GL_TEXTURE_RESIDENT_EXT           = 0x8067;
enum uint GL_TEXTURE_1D_BINDING_EXT         = 0x8068;
enum uint GL_TEXTURE_2D_BINDING_EXT         = 0x8069;
enum uint GL_TEXTURE_3D_BINDING_EXT         = 0x806A;

enum uint GL_EXT_texture_perturb_normal = 1;
enum uint GL_PERTURB_EXT                    = 0x85AE;
enum uint GL_TEXTURE_NORMAL_EXT             = 0x85AF;

enum uint GL_EXT_texture3D = 1;
enum uint GL_PACK_SKIP_IMAGES_EXT           = 0x806B;
enum uint GL_PACK_IMAGE_HEIGHT_EXT          = 0x806C;
enum uint GL_UNPACK_SKIP_IMAGES_EXT         = 0x806D;
enum uint GL_UNPACK_IMAGE_HEIGHT_EXT        = 0x806E;
enum uint GL_TEXTURE_3D_EXT                 = 0x806F;
enum uint GL_PROXY_TEXTURE_3D_EXT           = 0x8070;
enum uint GL_TEXTURE_DEPTH_EXT              = 0x8071;
enum uint GL_TEXTURE_WRAP_R_EXT             = 0x8072;
enum uint GL_MAX_3D_TEXTURE_SIZE_EXT        = 0x8073;

enum uint GL_EXT_vertex_array = 1;
enum uint GL_VERTEX_ARRAY_EXT               = 0x8074;
enum uint GL_NORMAL_ARRAY_EXT               = 0x8075;
enum uint GL_COLOR_ARRAY_EXT                = 0x8076;
enum uint GL_INDEX_ARRAY_EXT                = 0x8077;
enum uint GL_TEXTURE_COORD_ARRAY_EXT        = 0x8078;
enum uint GL_EDGE_FLAG_ARRAY_EXT            = 0x8079;
enum uint GL_VERTEX_ARRAY_SIZE_EXT          = 0x807A;
enum uint GL_VERTEX_ARRAY_TYPE_EXT          = 0x807B;
enum uint GL_VERTEX_ARRAY_STRIDE_EXT        = 0x807C;
enum uint GL_VERTEX_ARRAY_COUNT_EXT         = 0x807D;
enum uint GL_NORMAL_ARRAY_TYPE_EXT          = 0x807E;
enum uint GL_NORMAL_ARRAY_STRIDE_EXT        = 0x807F;
enum uint GL_NORMAL_ARRAY_COUNT_EXT         = 0x8080;
enum uint GL_COLOR_ARRAY_SIZE_EXT           = 0x8081;
enum uint GL_COLOR_ARRAY_TYPE_EXT           = 0x8082;
enum uint GL_COLOR_ARRAY_STRIDE_EXT         = 0x8083;
enum uint GL_COLOR_ARRAY_COUNT_EXT          = 0x8084;
enum uint GL_INDEX_ARRAY_TYPE_EXT           = 0x8085;
enum uint GL_INDEX_ARRAY_STRIDE_EXT         = 0x8086;
enum uint GL_INDEX_ARRAY_COUNT_EXT          = 0x8087;
enum uint GL_TEXTURE_COORD_ARRAY_SIZE_EXT   = 0x8088;
enum uint GL_TEXTURE_COORD_ARRAY_TYPE_EXT   = 0x8089;
enum uint GL_TEXTURE_COORD_ARRAY_STRIDE_EXT = 0x808A;
enum uint GL_TEXTURE_COORD_ARRAY_COUNT_EXT  = 0x808B;
enum uint GL_EDGE_FLAG_ARRAY_STRIDE_EXT     = 0x808C;
enum uint GL_EDGE_FLAG_ARRAY_COUNT_EXT      = 0x808D;
enum uint GL_VERTEX_ARRAY_POINTER_EXT       = 0x808E;
enum uint GL_NORMAL_ARRAY_POINTER_EXT       = 0x808F;
enum uint GL_COLOR_ARRAY_POINTER_EXT        = 0x8090;
enum uint GL_INDEX_ARRAY_POINTER_EXT        = 0x8091;
enum uint GL_TEXTURE_COORD_ARRAY_POINTER_EXT = 0x8092;
enum uint GL_EDGE_FLAG_ARRAY_POINTER_EXT    = 0x8093;

enum uint GL_EXT_vertex_shader = 1;
enum uint GL_VERTEX_SHADER_EXT              = 0x8780;
enum uint GL_VERTEX_SHADER_BINDING_EXT      = 0x8781;
enum uint GL_OP_INDEX_EXT                   = 0x8782;
enum uint GL_OP_NEGATE_EXT                  = 0x8783;
enum uint GL_OP_DOT3_EXT                    = 0x8784;
enum uint GL_OP_DOT4_EXT                    = 0x8785;
enum uint GL_OP_MUL_EXT                     = 0x8786;
enum uint GL_OP_ADD_EXT                     = 0x8787;
enum uint GL_OP_MADD_EXT                    = 0x8788;
enum uint GL_OP_FRAC_EXT                    = 0x8789;
enum uint GL_OP_MAX_EXT                     = 0x878A;
enum uint GL_OP_MIN_EXT                     = 0x878B;
enum uint GL_OP_SET_GE_EXT                  = 0x878C;
enum uint GL_OP_SET_LT_EXT                  = 0x878D;
enum uint GL_OP_CLAMP_EXT                   = 0x878E;
enum uint GL_OP_FLOOR_EXT                   = 0x878F;
enum uint GL_OP_ROUND_EXT                   = 0x8790;
enum uint GL_OP_EXP_BASE_2_EXT              = 0x8791;
enum uint GL_OP_LOG_BASE_2_EXT              = 0x8792;
enum uint GL_OP_POWER_EXT                   = 0x8793;
enum uint GL_OP_RECIP_EXT                   = 0x8794;
enum uint GL_OP_RECIP_SQRT_EXT              = 0x8795;
enum uint GL_OP_SUB_EXT                     = 0x8796;
enum uint GL_OP_CROSS_PRODUCT_EXT           = 0x8797;
enum uint GL_OP_MULTIPLY_MATRIX_EXT         = 0x8798;
enum uint GL_OP_MOV_EXT                     = 0x8799;
enum uint GL_OUTPUT_VERTEX_EXT              = 0x879A;
enum uint GL_OUTPUT_COLOR0_EXT              = 0x879B;
enum uint GL_OUTPUT_COLOR1_EXT              = 0x879C;
enum uint GL_OUTPUT_TEXTURE_COORD0_EXT      = 0x879D;
enum uint GL_OUTPUT_TEXTURE_COORD1_EXT      = 0x879E;
enum uint GL_OUTPUT_TEXTURE_COORD2_EXT      = 0x879F;
enum uint GL_OUTPUT_TEXTURE_COORD3_EXT      = 0x87A0;
enum uint GL_OUTPUT_TEXTURE_COORD4_EXT      = 0x87A1;
enum uint GL_OUTPUT_TEXTURE_COORD5_EXT      = 0x87A2;
enum uint GL_OUTPUT_TEXTURE_COORD6_EXT      = 0x87A3;
enum uint GL_OUTPUT_TEXTURE_COORD7_EXT      = 0x87A4;
enum uint GL_OUTPUT_TEXTURE_COORD8_EXT      = 0x87A5;
enum uint GL_OUTPUT_TEXTURE_COORD9_EXT      = 0x87A6;
enum uint GL_OUTPUT_TEXTURE_COORD10_EXT     = 0x87A7;
enum uint GL_OUTPUT_TEXTURE_COORD11_EXT     = 0x87A8;
enum uint GL_OUTPUT_TEXTURE_COORD12_EXT     = 0x87A9;
enum uint GL_OUTPUT_TEXTURE_COORD13_EXT     = 0x87AA;
enum uint GL_OUTPUT_TEXTURE_COORD14_EXT     = 0x87AB;
enum uint GL_OUTPUT_TEXTURE_COORD15_EXT     = 0x87AC;
enum uint GL_OUTPUT_TEXTURE_COORD16_EXT     = 0x87AD;
enum uint GL_OUTPUT_TEXTURE_COORD17_EXT     = 0x87AE;
enum uint GL_OUTPUT_TEXTURE_COORD18_EXT     = 0x87AF;
enum uint GL_OUTPUT_TEXTURE_COORD19_EXT     = 0x87B0;
enum uint GL_OUTPUT_TEXTURE_COORD20_EXT     = 0x87B1;
enum uint GL_OUTPUT_TEXTURE_COORD21_EXT     = 0x87B2;
enum uint GL_OUTPUT_TEXTURE_COORD22_EXT     = 0x87B3;
enum uint GL_OUTPUT_TEXTURE_COORD23_EXT     = 0x87B4;
enum uint GL_OUTPUT_TEXTURE_COORD24_EXT     = 0x87B5;
enum uint GL_OUTPUT_TEXTURE_COORD25_EXT     = 0x87B6;
enum uint GL_OUTPUT_TEXTURE_COORD26_EXT     = 0x87B7;
enum uint GL_OUTPUT_TEXTURE_COORD27_EXT     = 0x87B8;
enum uint GL_OUTPUT_TEXTURE_COORD28_EXT     = 0x87B9;
enum uint GL_OUTPUT_TEXTURE_COORD29_EXT     = 0x87BA;
enum uint GL_OUTPUT_TEXTURE_COORD30_EXT     = 0x87BB;
enum uint GL_OUTPUT_TEXTURE_COORD31_EXT     = 0x87BC;
enum uint GL_OUTPUT_FOG_EXT                 = 0x87BD;
enum uint GL_SCALAR_EXT                     = 0x87BE;
enum uint GL_VECTOR_EXT                     = 0x87BF;
enum uint GL_MATRIX_EXT                     = 0x87C0;
enum uint GL_VARIANT_EXT                    = 0x87C1;
enum uint GL_INVARIANT_EXT                  = 0x87C2;
enum uint GL_LOCAL_CONSTANT_EXT             = 0x87C3;
enum uint GL_LOCAL_EXT                      = 0x87C4;
enum uint GL_MAX_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87C5;
enum uint GL_MAX_VERTEX_SHADER_VARIANTS_EXT = 0x87C6;
enum uint GL_MAX_VERTEX_SHADER_INVARIANTS_EXT = 0x87C7;
enum uint GL_MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87C8;
enum uint GL_MAX_VERTEX_SHADER_LOCALS_EXT   = 0x87C9;
enum uint GL_MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87CA;
enum uint GL_MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT = 0x87CB;
enum uint GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87CC;
enum uint GL_MAX_OPTIMIZED_VERTEX_SHADER_INARIANTS_EXT = 0x87CD;
enum uint GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT = 0x87CE;
enum uint GL_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87CF;
enum uint GL_VERTEX_SHADER_VARIANTS_EXT     = 0x87D0;
enum uint GL_VERTEX_SHADER_INVARIANTS_EXT   = 0x87D1;
enum uint GL_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87D2;
enum uint GL_VERTEX_SHADER_LOCALS_EXT       = 0x87D3;
enum uint GL_VERTEX_SHADER_OPTIMIZED_EXT    = 0x87D4;
enum uint GL_X_EXT                          = 0x87D5;
enum uint GL_Y_EXT                          = 0x87D6;
enum uint GL_Z_EXT                          = 0x87D7;
enum uint GL_W_EXT                          = 0x87D8;
enum uint GL_NEGATIVE_X_EXT                 = 0x87D9;
enum uint GL_NEGATIVE_Y_EXT                 = 0x87DA;
enum uint GL_NEGATIVE_Z_EXT                 = 0x87DB;
enum uint GL_NEGATIVE_W_EXT                 = 0x87DC;
enum uint GL_ZERO_EXT                       = 0x87DD;
enum uint GL_ONE_EXT                        = 0x87DE;
enum uint GL_NEGATIVE_ONE_EXT               = 0x87DF;
enum uint GL_NORMALIZED_RANGE_EXT           = 0x87E0;
enum uint GL_FULL_RANGE_EXT                 = 0x87E1;
enum uint GL_CURRENT_VERTEX_EXT             = 0x87E2;
enum uint GL_MVP_MATRIX_EXT                 = 0x87E3;
enum uint GL_VARIANT_VALUE_EXT              = 0x87E4;
enum uint GL_VARIANT_DATATYPE_EXT           = 0x87E5;
enum uint GL_VARIANT_ARRAY_STRIDE_EXT       = 0x87E6;
enum uint GL_VARIANT_ARRAY_TYPE_EXT         = 0x87E7;
enum uint GL_VARIANT_ARRAY_EXT              = 0x87E8;
enum uint GL_VARIANT_ARRAY_POINTER_EXT      = 0x87E9;
enum uint GL_INVARIANT_VALUE_EXT            = 0x87EA;
enum uint GL_INVARIANT_DATATYPE_EXT         = 0x87EB;
enum uint GL_LOCAL_CONSTANT_VALUE_EXT       = 0x87EC;
enum uint GL_LOCAL_CONSTANT_DATATYPE_EXT    = 0x87ED;

enum uint GL_EXT_vertex_weighting = 1;
enum uint GL_MODELVIEW0_STACK_DEPTH_EXT      = GL_MODELVIEW_STACK_DEPTH;
enum uint GL_MODELVIEW1_STACK_DEPTH_EXT      = 0x8502;
enum uint GL_MODELVIEW0_MATRIX_EXT           = GL_MODELVIEW_MATRIX;
enum uint GL_MODELVIEW1_MATRIX_EXT           = 0x8506;
enum uint GL_VERTEX_WEIGHTING_EXT            = 0x8509;
enum uint GL_MODELVIEW0_EXT                  = GL_MODELVIEW;
enum uint GL_MODELVIEW1_EXT                  = 0x850A;
enum uint GL_CURRENT_VERTEX_WEIGHT_EXT       = 0x850B;
enum uint GL_VERTEX_WEIGHT_ARRAY_EXT         = 0x850C;
enum uint GL_VERTEX_WEIGHT_ARRAY_SIZE_EXT    = 0x850D;
enum uint GL_VERTEX_WEIGHT_ARRAY_TYPE_EXT    = 0x850E;
enum uint GL_VERTEX_WEIGHT_ARRAY_STRIDE_EXT  = 0x850F;
enum uint GL_VERTEX_WEIGHT_ARRAY_POINTER_EXT = 0x8510;



/*-----------------------------------------------------------------------
 * 3DFX
 *----------------------------------------------------------------------*/

enum uint GL_3DFX_multisample = 1;
enum uint GL_MULTISAMPLE_3DFX               = 0x86B2;
enum uint GL_SAMPLE_BUFFERS_3DFX            = 0x86B3;
enum uint GL_SAMPLES_3DFX                   = 0x86B4;
enum uint GL_MULTISAMPLE_BIT_3DFX           = 0x20000000;

enum uint GL_3DFX_tbuffer = 1;

enum uint GL_3DFX_texture_compression_FXT1 = 1;
enum uint GL_COMPRESSED_RGB_FXT1_3DFX       = 0x86B0;
enum uint GL_COMPRESSED_RGBA_FXT1_3DFX      = 0x86B1;



/*-----------------------------------------------------------------------
 * APPLE
 *----------------------------------------------------------------------*/

enum uint GL_APPLE_specular_vector = 1;
enum uint GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE = 0x85B0;

enum uint GL_APPLE_transform_hint = 1;
enum uint GL_TRANSFORM_HINT_APPLE           = 0x85B1;



/*-----------------------------------------------------------------------
 * ATI
 *----------------------------------------------------------------------*/

enum uint GL_ATI_element_array = 1;
enum uint GL_ELEMENT_ARRAY_ATI              = 0x8768;
enum uint GL_ELEMENT_ARRAY_TYPE_ATI         = 0x8769;
enum uint GL_ELEMENT_ARRAY_POINTER_ATI      = 0x876A;

enum uint GL_ATI_envmap_bumpmap = 1;
enum uint GL_BUMP_ROT_MATRIX_ATI            = 0x8775;
enum uint GL_BUMP_ROT_MATRIX_SIZE_ATI       = 0x8776;
enum uint GL_BUMP_NUM_TEX_UNITS_ATI         = 0x8777;
enum uint GL_BUMP_TEX_UNITS_ATI             = 0x8778;
enum uint GL_DUDV_ATI                       = 0x8779;
enum uint GL_DU8DV8_ATI                     = 0x877A;
enum uint GL_BUMP_ENVMAP_ATI                = 0x877B;
enum uint GL_BUMP_TARGET_ATI                = 0x877C;

enum uint GL_ATI_fragment_shader = 1;
enum uint GL_FRAGMENT_SHADER_ATI            = 0x8920;
enum uint GL_REG_0_ATI                      = 0x8921;
enum uint GL_REG_1_ATI                      = 0x8922;
enum uint GL_REG_2_ATI                      = 0x8923;
enum uint GL_REG_3_ATI                      = 0x8924;
enum uint GL_REG_4_ATI                      = 0x8925;
enum uint GL_REG_5_ATI                      = 0x8926;
enum uint GL_REG_6_ATI                      = 0x8927;
enum uint GL_REG_7_ATI                      = 0x8928;
enum uint GL_REG_8_ATI                      = 0x8929;
enum uint GL_REG_9_ATI                      = 0x892A;
enum uint GL_REG_10_ATI                     = 0x892B;
enum uint GL_REG_11_ATI                     = 0x892C;
enum uint GL_REG_12_ATI                     = 0x892D;
enum uint GL_REG_13_ATI                     = 0x892E;
enum uint GL_REG_14_ATI                     = 0x892F;
enum uint GL_REG_15_ATI                     = 0x8930;
enum uint GL_REG_16_ATI                     = 0x8931;
enum uint GL_REG_17_ATI                     = 0x8932;
enum uint GL_REG_18_ATI                     = 0x8933;
enum uint GL_REG_19_ATI                     = 0x8934;
enum uint GL_REG_20_ATI                     = 0x8935;
enum uint GL_REG_21_ATI                     = 0x8936;
enum uint GL_REG_22_ATI                     = 0x8937;
enum uint GL_REG_23_ATI                     = 0x8938;
enum uint GL_REG_24_ATI                     = 0x8939;
enum uint GL_REG_25_ATI                     = 0x893A;
enum uint GL_REG_26_ATI                     = 0x893B;
enum uint GL_REG_27_ATI                     = 0x893C;
enum uint GL_REG_28_ATI                     = 0x893D;
enum uint GL_REG_29_ATI                     = 0x893E;
enum uint GL_REG_30_ATI                     = 0x893F;
enum uint GL_REG_31_ATI                     = 0x8940;
enum uint GL_CON_0_ATI                      = 0x8941;
enum uint GL_CON_1_ATI                      = 0x8942;
enum uint GL_CON_2_ATI                      = 0x8943;
enum uint GL_CON_3_ATI                      = 0x8944;
enum uint GL_CON_4_ATI                      = 0x8945;
enum uint GL_CON_5_ATI                      = 0x8946;
enum uint GL_CON_6_ATI                      = 0x8947;
enum uint GL_CON_7_ATI                      = 0x8948;
enum uint GL_CON_8_ATI                      = 0x8949;
enum uint GL_CON_9_ATI                      = 0x894A;
enum uint GL_CON_10_ATI                     = 0x894B;
enum uint GL_CON_11_ATI                     = 0x894C;
enum uint GL_CON_12_ATI                     = 0x894D;
enum uint GL_CON_13_ATI                     = 0x894E;
enum uint GL_CON_14_ATI                     = 0x894F;
enum uint GL_CON_15_ATI                     = 0x8950;
enum uint GL_CON_16_ATI                     = 0x8951;
enum uint GL_CON_17_ATI                     = 0x8952;
enum uint GL_CON_18_ATI                     = 0x8953;
enum uint GL_CON_19_ATI                     = 0x8954;
enum uint GL_CON_20_ATI                     = 0x8955;
enum uint GL_CON_21_ATI                     = 0x8956;
enum uint GL_CON_22_ATI                     = 0x8957;
enum uint GL_CON_23_ATI                     = 0x8958;
enum uint GL_CON_24_ATI                     = 0x8959;
enum uint GL_CON_25_ATI                     = 0x895A;
enum uint GL_CON_26_ATI                     = 0x895B;
enum uint GL_CON_27_ATI                     = 0x895C;
enum uint GL_CON_28_ATI                     = 0x895D;
enum uint GL_CON_29_ATI                     = 0x895E;
enum uint GL_CON_30_ATI                     = 0x895F;
enum uint GL_CON_31_ATI                     = 0x8960;
enum uint GL_MOV_ATI                        = 0x8961;
enum uint GL_ADD_ATI                        = 0x8963;
enum uint GL_MUL_ATI                        = 0x8964;
enum uint GL_SUB_ATI                        = 0x8965;
enum uint GL_DOT3_ATI                       = 0x8966;
enum uint GL_DOT4_ATI                       = 0x8967;
enum uint GL_MAD_ATI                        = 0x8968;
enum uint GL_LERP_ATI                       = 0x8969;
enum uint GL_CND_ATI                        = 0x896A;
enum uint GL_CND0_ATI                       = 0x896B;
enum uint GL_DOT2_ADD_ATI                   = 0x896C;
enum uint GL_SECONDARY_INTERPOLATOR_ATI     = 0x896D;
enum uint GL_NUM_FRAGMENT_REGISTERS_ATI     = 0x896E;
enum uint GL_NUM_FRAGMENT_CONSTANTS_ATI     = 0x896F;
enum uint GL_NUM_PASSES_ATI                 = 0x8970;
enum uint GL_NUM_INSTRUCTIONS_PER_PASS_ATI  = 0x8971;
enum uint GL_NUM_INSTRUCTIONS_TOTAL_ATI     = 0x8972;
enum uint GL_NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI = 0x8973;
enum uint GL_NUM_LOOPBACK_COMPONENTS_ATI    = 0x8974;
enum uint GL_COLOR_ALPHA_PAIRING_ATI        = 0x8975;
enum uint GL_SWIZZLE_STR_ATI                = 0x8976;
enum uint GL_SWIZZLE_STQ_ATI                = 0x8977;
enum uint GL_SWIZZLE_STR_DR_ATI             = 0x8978;
enum uint GL_SWIZZLE_STQ_DQ_ATI             = 0x8979;
enum uint GL_SWIZZLE_STRQ_ATI               = 0x897A;
enum uint GL_SWIZZLE_STRQ_DQ_ATI            = 0x897B;
enum uint GL_RED_BIT_ATI                    = 0x00000001;
enum uint GL_GREEN_BIT_ATI                  = 0x00000002;
enum uint GL_BLUE_BIT_ATI                   = 0x00000004;
enum uint GL_2X_BIT_ATI                     = 0x00000001;
enum uint GL_4X_BIT_ATI                     = 0x00000002;
enum uint GL_8X_BIT_ATI                     = 0x00000004;
enum uint GL_HALF_BIT_ATI                   = 0x00000008;
enum uint GL_QUARTER_BIT_ATI                = 0x00000010;
enum uint GL_EIGHTH_BIT_ATI                 = 0x00000020;
enum uint GL_SATURATE_BIT_ATI               = 0x00000040;
enum uint GL_COMP_BIT_ATI                   = 0x00000002;
enum uint GL_NEGATE_BIT_ATI                 = 0x00000004;
enum uint GL_BIAS_BIT_ATI                   = 0x00000008;

enum uint GL_ATI_pn_triangles = 1;
enum uint GL_PN_TRIANGLES_ATI                       = 0x87F0;
enum uint GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI = 0x87F1;
enum uint GL_PN_TRIANGLES_POINT_MODE_ATI            = 0x87F2;
enum uint GL_PN_TRIANGLES_NORMAL_MODE_ATI           = 0x87F3;
enum uint GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI     = 0x87F4;
enum uint GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI     = 0x87F5;
enum uint GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI      = 0x87F6;
enum uint GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI    = 0x87F7;
enum uint GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI = 0x87F8;

enum uint GL_ATI_texture_mirror_once = 1;
enum uint GL_MIRROR_CLAMP_ATI               = 0x8742;
enum uint GL_MIRROR_CLAMP_TO_EDGE_ATI       = 0x8743;

enum uint GL_ATI_vertex_array_object = 1;
enum uint GL_STATIC_ATI                     = 0x8760;
enum uint GL_DYNAMIC_ATI                    = 0x8761;
enum uint GL_PRESERVE_ATI                   = 0x8762;
enum uint GL_DISCARD_ATI                    = 0x8763;
enum uint GL_OBJECT_BUFFER_SIZE_ATI         = 0x8764;
enum uint GL_OBJECT_BUFFER_USAGE_ATI        = 0x8765;
enum uint GL_ARRAY_OBJECT_BUFFER_ATI        = 0x8766;
enum uint GL_ARRAY_OBJECT_OFFSET_ATI        = 0x8767;

enum uint GL_ATI_vertex_streams = 1;
enum uint GL_MAX_VERTEX_STREAMS_ATI         = 0x876B;
enum uint GL_VERTEX_STREAM0_ATI             = 0x876C;
enum uint GL_VERTEX_STREAM1_ATI             = 0x876D;
enum uint GL_VERTEX_STREAM2_ATI             = 0x876E;
enum uint GL_VERTEX_STREAM3_ATI             = 0x876F;
enum uint GL_VERTEX_STREAM4_ATI             = 0x8770;
enum uint GL_VERTEX_STREAM5_ATI             = 0x8771;
enum uint GL_VERTEX_STREAM6_ATI             = 0x8772;
enum uint GL_VERTEX_STREAM7_ATI             = 0x8773;
enum uint GL_VERTEX_SOURCE_ATI              = 0x8774;



/*-----------------------------------------------------------------------
 * HP (Hewlett Packard)
 *----------------------------------------------------------------------*/

enum uint GL_HP_convolution_border_modes = 1;
enum uint GL_IGNORE_BORDER_HP               = 0x8150;
enum uint GL_CONSTANT_BORDER_HP             = 0x8151;
enum uint GL_REPLICATE_BORDER_HP            = 0x8153;
enum uint GL_CONVOLUTION_BORDER_COLOR_HP    = 0x8154;

enum uint GL_HP_image_transform = 1;
enum uint GL_IMAGE_SCALE_X_HP               = 0x8155;
enum uint GL_IMAGE_SCALE_Y_HP               = 0x8156;
enum uint GL_IMAGE_TRANSLATE_X_HP           = 0x8157;
enum uint GL_IMAGE_TRANSLATE_Y_HP           = 0x8158;
enum uint GL_IMAGE_ROTATE_ANGLE_HP          = 0x8159;
enum uint GL_IMAGE_ROTATE_ORIGIN_X_HP       = 0x815A;
enum uint GL_IMAGE_ROTATE_ORIGIN_Y_HP       = 0x815B;
enum uint GL_IMAGE_MAG_FILTER_HP            = 0x815C;
enum uint GL_IMAGE_MIN_FILTER_HP            = 0x815D;
enum uint GL_IMAGE_CUBIC_WEIGHT_HP          = 0x815E;
enum uint GL_CUBIC_HP                       = 0x815F;
enum uint GL_AVERAGE_HP                     = 0x8160;
enum uint GL_IMAGE_TRANSFORM_2D_HP          = 0x8161;
enum uint GL_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP = 0x8162;
enum uint GL_PROXY_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP = 0x8163;

enum uint GL_HP_occlusion_test = 1;
enum uint GL_OCCLUSION_TEST_HP              = 0x8165;
enum uint GL_OCCLUSION_TEST_RESULT_HP       = 0x8166;

enum uint GL_HP_texture_lighting = 1;
enum uint GL_TEXTURE_LIGHTING_MODE_HP       = 0x8167;
enum uint GL_TEXTURE_POST_SPECULAR_HP       = 0x8168;
enum uint GL_TEXTURE_PRE_SPECULAR_HP        = 0x8169;



/*-----------------------------------------------------------------------
 * IBM
 *----------------------------------------------------------------------*/

enum uint GL_IBM_cull_vertex = 1;
enum uint GL_CULL_VERTEX_IBM                = 103050;

enum uint GL_IBM_multimode_draw_arrays = 1;

enum uint GL_IBM_rasterpos_clip = 1;
enum uint GL_RASTER_POSITION_UNCLIPPED_IBM  = 0x19262;

enum uint GL_IBM_texture_mirrored_repeat = 1;
enum uint GL_MIRRORED_REPEAT_IBM            = 0x8370;

enum uint GL_IBM_vertex_array_lists = 1;
enum uint GL_VERTEX_ARRAY_LIST_IBM                 = 103070;
enum uint GL_NORMAL_ARRAY_LIST_IBM                 = 103071;
enum uint GL_COLOR_ARRAY_LIST_IBM                  = 103072;
enum uint GL_INDEX_ARRAY_LIST_IBM                  = 103073;
enum uint GL_TEXTURE_COORD_ARRAY_LIST_IBM          = 103074;
enum uint GL_EDGE_FLAG_ARRAY_LIST_IBM              = 103075;
enum uint GL_FOG_COORDINATE_ARRAY_LIST_IBM         = 103076;
enum uint GL_SECONDARY_COLOR_ARRAY_LIST_IBM        = 103077;
enum uint GL_VERTEX_ARRAY_LIST_STRIDE_IBM          = 103080;
enum uint GL_NORMAL_ARRAY_LIST_STRIDE_IBM          = 103081;
enum uint GL_COLOR_ARRAY_LIST_STRIDE_IBM           = 103082;
enum uint GL_INDEX_ARRAY_LIST_STRIDE_IBM           = 103083;
enum uint GL_TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM   = 103084;
enum uint GL_EDGE_FLAG_ARRAY_LIST_STRIDE_IBM       = 103085;
enum uint GL_FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM  = 103086;
enum uint GL_SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM = 103087;



/*-----------------------------------------------------------------------
 * INGR
 *----------------------------------------------------------------------*/

enum uint GL_INGR_color_clamp = 1;
enum uint GL_RED_MIN_CLAMP_INGR             = 0x8560;
enum uint GL_GREEN_MIN_CLAMP_INGR           = 0x8561;
enum uint GL_BLUE_MIN_CLAMP_INGR            = 0x8562;
enum uint GL_ALPHA_MIN_CLAMP_INGR           = 0x8563;
enum uint GL_RED_MAX_CLAMP_INGR             = 0x8564;
enum uint GL_GREEN_MAX_CLAMP_INGR           = 0x8565;
enum uint GL_BLUE_MAX_CLAMP_INGR            = 0x8566;
enum uint GL_ALPHA_MAX_CLAMP_INGR           = 0x8567;

enum uint GL_INGR_interlace_read = 1;
enum uint GL_INTERLACE_READ_INGR            = 0x8568;

enum uint GL_INGR_palette_buffer = 1;



/*-----------------------------------------------------------------------
 * INTEL
 *----------------------------------------------------------------------*/

enum uint GL_INTEL_parallel_arrays = 1;
enum uint GL_PARALLEL_ARRAYS_INTEL          = 0x83F4;
enum uint GL_VERTEX_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F5;
enum uint GL_NORMAL_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F6;
enum uint GL_COLOR_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F7;
enum uint GL_TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F8;

enum uint GL_INTEL_texture_scissor = 1;



/*-----------------------------------------------------------------------
 * MESA (Brian Pauls Mesa3D)
 *----------------------------------------------------------------------*/

enum uint GL_MESA_resize_buffers = 1;

enum uint GL_MESA_window_pos = 1;



/*-----------------------------------------------------------------------
 * NV (nVidia)
 *----------------------------------------------------------------------*/

enum uint GL_NV_blend_square = 1;

enum uint GL_NV_copy_depth_to_color = 1;
enum uint GL_DEPTH_STENCIL_TO_RGBA_NV       = 0x886E;
enum uint GL_DEPTH_STENCIL_TO_BGRA_NV       = 0x886F;

enum uint GL_NV_depth_clamp = 1;
enum uint GL_DEPTH_CLAMP_NV                 = 0x864F;

enum uint GL_NV_element_array = 1;
enum uint GL_ELEMENT_ARRAY_TYPE_NV          = 0x8769;
enum uint GL_ELEMENT_ARRAY_POINTER_NV       = 0x876A;

enum uint GL_NV_evaluators = 1;
enum uint GL_EVAL_2D_NV                     = 0x86C0;
enum uint GL_EVAL_TRIANGULAR_2D_NV          = 0x86C1;
enum uint GL_MAP_TESSELLATION_NV            = 0x86C2;
enum uint GL_MAP_ATTRIB_U_ORDER_NV          = 0x86C3;
enum uint GL_MAP_ATTRIB_V_ORDER_NV          = 0x86C4;
enum uint GL_EVAL_FRACTIONAL_TESSELLATION_NV = 0x86C5;
enum uint GL_EVAL_VERTEX_ATTRIB0_NV         = 0x86C6;
enum uint GL_EVAL_VERTEX_ATTRIB1_NV         = 0x86C7;
enum uint GL_EVAL_VERTEX_ATTRIB2_NV         = 0x86C8;
enum uint GL_EVAL_VERTEX_ATTRIB3_NV         = 0x86C9;
enum uint GL_EVAL_VERTEX_ATTRIB4_NV         = 0x86CA;
enum uint GL_EVAL_VERTEX_ATTRIB5_NV         = 0x86CB;
enum uint GL_EVAL_VERTEX_ATTRIB6_NV         = 0x86CC;
enum uint GL_EVAL_VERTEX_ATTRIB7_NV         = 0x86CD;
enum uint GL_EVAL_VERTEX_ATTRIB8_NV         = 0x86CE;
enum uint GL_EVAL_VERTEX_ATTRIB9_NV         = 0x86CF;
enum uint GL_EVAL_VERTEX_ATTRIB10_NV        = 0x86D0;
enum uint GL_EVAL_VERTEX_ATTRIB11_NV        = 0x86D1;
enum uint GL_EVAL_VERTEX_ATTRIB12_NV        = 0x86D2;
enum uint GL_EVAL_VERTEX_ATTRIB13_NV        = 0x86D3;
enum uint GL_EVAL_VERTEX_ATTRIB14_NV        = 0x86D4;
enum uint GL_EVAL_VERTEX_ATTRIB15_NV        = 0x86D5;
enum uint GL_MAX_MAP_TESSELLATION_NV        = 0x86D6;
enum uint GL_MAX_RATIONAL_EVAL_ORDER_NV     = 0x86D7;

enum uint GL_NV_fence = 1;
enum uint GL_ALL_COMPLETED_NV               = 0x84F2;
enum uint GL_FENCE_STATUS_NV                = 0x84F3;
enum uint GL_FENCE_CONDITION_NV             = 0x84F4;

enum uint GL_NV_float_buffer = 1;
enum uint GL_FLOAT_R_NV                     = 0x8880;
enum uint GL_FLOAT_RG_NV                    = 0x8881;
enum uint GL_FLOAT_RGB_NV                   = 0x8882;
enum uint GL_FLOAT_RGBA_NV                  = 0x8883;
enum uint GL_FLOAT_R16_NV                   = 0x8884;
enum uint GL_FLOAT_R32_NV                   = 0x8885;
enum uint GL_FLOAT_RG16_NV                  = 0x8886;
enum uint GL_FLOAT_RG32_NV                  = 0x8887;
enum uint GL_FLOAT_RGB16_NV                 = 0x8888;
enum uint GL_FLOAT_RGB32_NV                 = 0x8889;
enum uint GL_FLOAT_RGBA16_NV                = 0x888A;
enum uint GL_FLOAT_RGBA32_NV                = 0x888B;
enum uint GL_TEXTURE_FLOAT_COMPONENTS_NV    = 0x888C;
enum uint GL_FLOAT_CLEAR_COLOR_VALUE_NV     = 0x888D;
enum uint GL_FLOAT_RGBA_MODE_NV             = 0x888E;

enum uint GL_NV_fog_distance = 1;
enum uint GL_FOG_DISTANCE_MODE_NV           = 0x855A;
enum uint GL_EYE_RADIAL_NV                  = 0x855B;
enum uint GL_EYE_PLANE_ABSOLUTE_NV          = 0x855C;
/* reuse GL_EYE_PLANE */

enum uint GL_NV_fragment_program = 1;
enum uint GL_FRAGMENT_PROGRAM_NV            = 0x8870;
enum uint GL_MAX_TEXTURE_COORDS_NV          = 0x8871;
enum uint GL_MAX_TEXTURE_IMAGE_UNITS_NV     = 0x8872;
enum uint GL_FRAGMENT_PROGRAM_BINDING_NV    = 0x8873;
enum uint GL_PROGRAM_ERROR_STRING_NV        = 0x8874;
enum uint GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV = 0x8868;

enum uint GL_NV_half_float = 1;
enum uint GL_HALF_FLOAT_NV                  = 0x140B;

enum uint GL_NV_light_max_exponent = 1;
enum uint GL_MAX_SHININESS_NV               = 0x8504;
enum uint GL_MAX_SPOT_EXPONENT_NV           = 0x8505;

enum uint GL_NV_multisample_filter_hint = 1;
enum uint GL_MULTISAMPLE_FILTER_HINT_NV     = 0x8534;

enum uint GL_NV_occlusion_query = 1;
enum uint GL_PIXEL_COUNTER_BITS_NV          = 0x8864;
enum uint GL_CURRENT_OCCLUSION_QUERY_ID_NV  = 0x8865;
enum uint GL_PIXEL_COUNT_NV                 = 0x8866;
enum uint GL_PIXEL_COUNT_AVAILABLE_NV       = 0x8867;

enum uint GL_NV_packed_depth_stencil = 1;
enum uint GL_DEPTH_STENCIL_NV               = 0x84F9;
enum uint GL_UNSIGNED_INT_24_8_NV           = 0x84FA;

enum uint GL_NV_pixel_data_range = 1;
enum uint GL_WRITE_PIXEL_DATA_RANGE_NV      = 0x8878;
enum uint GL_READ_PIXEL_DATA_RANGE_NV       = 0x8879;
enum uint GL_WRITE_PIXEL_DATA_RANGE_LENGTH_NV = 0x887A;
enum uint GL_READ_PIXEL_DATA_RANGE_LENGTH_NV = 0x887B;
enum uint GL_WRITE_PIXEL_DATA_RANGE_POINTER_NV = 0x887C;
enum uint GL_READ_PIXEL_DATA_RANGE_POINTER_NV = 0x887D;

enum uint GL_NV_point_sprite = 1;
enum uint GL_POINT_SPRITE_NV                = 0x8861;
enum uint GL_COORD_REPLACE_NV               = 0x8862;
enum uint GL_POINT_SPRITE_R_MODE_NV         = 0x8863;

enum uint GL_NV_primitive_restart = 1;
enum uint GL_PRIMITIVE_RESTART_NV           = 0x8558;
enum uint GL_PRIMITIVE_RESTART_INDEX_NV     = 0x8559;

enum uint GL_NV_register_combiners = 1;
enum uint GL_REGISTER_COMBINERS_NV          = 0x8522;
enum uint GL_VARIABLE_A_NV                  = 0x8523;
enum uint GL_VARIABLE_B_NV                  = 0x8524;
enum uint GL_VARIABLE_C_NV                  = 0x8525;
enum uint GL_VARIABLE_D_NV                  = 0x8526;
enum uint GL_VARIABLE_E_NV                  = 0x8527;
enum uint GL_VARIABLE_F_NV                  = 0x8528;
enum uint GL_VARIABLE_G_NV                  = 0x8529;
enum uint GL_CONSTANT_COLOR0_NV             = 0x852A;
enum uint GL_CONSTANT_COLOR1_NV             = 0x852B;
enum uint GL_PRIMARY_COLOR_NV               = 0x852C;
enum uint GL_SECONDARY_COLOR_NV             = 0x852D;
enum uint GL_SPARE0_NV                      = 0x852E;
enum uint GL_SPARE1_NV                      = 0x852F;
enum uint GL_DISCARD_NV                     = 0x8530;
enum uint GL_E_TIMES_F_NV                   = 0x8531;
enum uint GL_SPARE0_PLUS_SECONDARY_COLOR_NV = 0x8532;
enum uint GL_UNSIGNED_IDENTITY_NV           = 0x8536;
enum uint GL_UNSIGNED_INVERT_NV             = 0x8537;
enum uint GL_EXPAND_NORMAL_NV               = 0x8538;
enum uint GL_EXPAND_NEGATE_NV               = 0x8539;
enum uint GL_HALF_BIAS_NORMAL_NV            = 0x853A;
enum uint GL_HALF_BIAS_NEGATE_NV            = 0x853B;
enum uint GL_SIGNED_IDENTITY_NV             = 0x853C;
enum uint GL_SIGNED_NEGATE_NV               = 0x853D;
enum uint GL_SCALE_BY_TWO_NV                = 0x853E;
enum uint GL_SCALE_BY_FOUR_NV               = 0x853F;
enum uint GL_SCALE_BY_ONE_HALF_NV           = 0x8540;
enum uint GL_BIAS_BY_NEGATIVE_ONE_HALF_NV   = 0x8541;
enum uint GL_COMBINER_INPUT_NV              = 0x8542;
enum uint GL_COMBINER_MAPPING_NV            = 0x8543;
enum uint GL_COMBINER_COMPONENT_USAGE_NV    = 0x8544;
enum uint GL_COMBINER_AB_DOT_PRODUCT_NV     = 0x8545;
enum uint GL_COMBINER_CD_DOT_PRODUCT_NV     = 0x8546;
enum uint GL_COMBINER_MUX_SUM_NV            = 0x8547;
enum uint GL_COMBINER_SCALE_NV              = 0x8548;
enum uint GL_COMBINER_BIAS_NV               = 0x8549;
enum uint GL_COMBINER_AB_OUTPUT_NV          = 0x854A;
enum uint GL_COMBINER_CD_OUTPUT_NV          = 0x854B;
enum uint GL_COMBINER_SUM_OUTPUT_NV         = 0x854C;
enum uint GL_MAX_GENERAL_COMBINERS_NV       = 0x854D;
enum uint GL_NUM_GENERAL_COMBINERS_NV       = 0x854E;
enum uint GL_COLOR_SUM_CLAMP_NV             = 0x854F;
enum uint GL_COMBINER0_NV                   = 0x8550;
enum uint GL_COMBINER1_NV                   = 0x8551;
enum uint GL_COMBINER2_NV                   = 0x8552;
enum uint GL_COMBINER3_NV                   = 0x8553;
enum uint GL_COMBINER4_NV                   = 0x8554;
enum uint GL_COMBINER5_NV                   = 0x8555;
enum uint GL_COMBINER6_NV                   = 0x8556;
enum uint GL_COMBINER7_NV                   = 0x8557;
/* reuse GL_TEXTURE0_ARB */
/* reuse GL_TEXTURE1_ARB */
/* reuse GL_ZERO */
/* reuse GL_NONE */
/* reuse GL_FOG */

enum uint GL_NV_register_combiners2 = 1;
enum uint GL_PER_STAGE_CONSTANTS_NV         = 0x8535;

enum uint GL_NV_stencil_two_side = 1;
enum uint GL_STENCIL_TEST_TWO_SIDE_NV       = 0x8910;
enum uint GL_ACTIVE_STENCIL_FACE_NV         = 0x8911;

enum uint GL_NV_texgen_emboss = 1;
enum uint GL_EMBOSS_LIGHT_NV                = 0x855D;
enum uint GL_EMBOSS_CONSTANT_NV             = 0x855E;
enum uint GL_EMBOSS_MAP_NV                  = 0x855F;

enum uint GL_NV_texgen_reflection = 1;
enum uint GL_NORMAL_MAP_NV                  = 0x8511;
enum uint GL_REFLECTION_MAP_NV              = 0x8512;

enum uint GL_NV_texture_compression_vtc = 1;

enum uint GL_NV_texture_env_combine4 = 1;
enum uint GL_COMBINE4_NV                    = 0x8503;
enum uint GL_SOURCE3_RGB_NV                 = 0x8583;
enum uint GL_SOURCE3_ALPHA_NV               = 0x858B;
enum uint GL_OPERAND3_RGB_NV                = 0x8593;
enum uint GL_OPERAND3_ALPHA_NV              = 0x859B;

enum uint GL_NV_texture_rectangle = 1;
enum uint GL_TEXTURE_RECTANGLE_NV           = 0x84F5;
enum uint GL_TEXTURE_BINDING_RECTANGLE_NV   = 0x84F6;
enum uint GL_PROXY_TEXTURE_RECTANGLE_NV     = 0x84F7;
enum uint GL_MAX_RECTANGLE_TEXTURE_SIZE_NV  = 0x84F8;

enum uint GL_NV_texture_shader = 1;
enum uint GL_OFFSET_TEXTURE_RECTANGLE_NV    = 0x864C;
enum uint GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV = 0x864D;
enum uint GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV = 0x864E;
enum uint GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV = 0x86D9;
enum uint GL_UNSIGNED_INT_S8_S8_8_8_NV      = 0x86DA;
enum uint GL_UNSIGNED_INT_8_8_S8_S8_REV_NV  = 0x86DB;
enum uint GL_DSDT_MAG_INTENSITY_NV          = 0x86DC;
enum uint GL_SHADER_CONSISTENT_NV           = 0x86DD;
enum uint GL_TEXTURE_SHADER_NV              = 0x86DE;
enum uint GL_SHADER_OPERATION_NV            = 0x86DF;
enum uint GL_CULL_MODES_NV                  = 0x86E0;
enum uint GL_OFFSET_TEXTURE_MATRIX_NV       = 0x86E1;
enum uint GL_OFFSET_TEXTURE_SCALE_NV        = 0x86E2;
enum uint GL_OFFSET_TEXTURE_BIAS_NV         = 0x86E3;
enum uint GL_OFFSET_TEXTURE_2D_MATRIX_NV    = GL_OFFSET_TEXTURE_MATRIX_NV;
enum uint GL_OFFSET_TEXTURE_2D_SCALE_NV     = GL_OFFSET_TEXTURE_SCALE_NV;
enum uint GL_OFFSET_TEXTURE_2D_BIAS_NV      = GL_OFFSET_TEXTURE_BIAS_NV;
enum uint GL_PREVIOUS_TEXTURE_INPUT_NV      = 0x86E4;
enum uint GL_CONST_EYE_NV                   = 0x86E5;
enum uint GL_PASS_THROUGH_NV                = 0x86E6;
enum uint GL_CULL_FRAGMENT_NV               = 0x86E7;
enum uint GL_OFFSET_TEXTURE_2D_NV           = 0x86E8;
enum uint GL_DEPENDENT_AR_TEXTURE_2D_NV     = 0x86E9;
enum uint GL_DEPENDENT_GB_TEXTURE_2D_NV     = 0x86EA;
enum uint GL_DOT_PRODUCT_NV                 = 0x86EC;
enum uint GL_DOT_PRODUCT_DEPTH_REPLACE_NV   = 0x86ED;
enum uint GL_DOT_PRODUCT_TEXTURE_2D_NV      = 0x86EE;
enum uint GL_DOT_PRODUCT_TEXTURE_3D_NV      = 0x86EF;
enum uint GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV = 0x86F0;
enum uint GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV = 0x86F1;
enum uint GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV = 0x86F2;
enum uint GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV = 0x86F3;
enum uint GL_HILO_NV                        = 0x86F4;
enum uint GL_DSDT_NV                        = 0x86F5;
enum uint GL_DSDT_MAG_NV                    = 0x86F6;
enum uint GL_DSDT_MAG_VIB_NV                = 0x86F7;
enum uint GL_HILO16_NV                      = 0x86F8;
enum uint GL_SIGNED_HILO_NV                 = 0x86F9;
enum uint GL_SIGNED_HILO16_NV               = 0x86FA;
enum uint GL_SIGNED_RGBA_NV                 = 0x86FB;
enum uint GL_SIGNED_RGBA8_NV                = 0x86FC;
enum uint GL_SIGNED_RGB_NV                  = 0x86FE;
enum uint GL_SIGNED_RGB8_NV                 = 0x86FF;
enum uint GL_SIGNED_LUMINANCE_NV            = 0x8701;
enum uint GL_SIGNED_LUMINANCE8_NV           = 0x8702;
enum uint GL_SIGNED_LUMINANCE_ALPHA_NV      = 0x8703;
enum uint GL_SIGNED_LUMINANCE8_ALPHA8_NV    = 0x8704;
enum uint GL_SIGNED_ALPHA_NV                = 0x8705;
enum uint GL_SIGNED_ALPHA8_NV               = 0x8706;
enum uint GL_SIGNED_INTENSITY_NV            = 0x8707;
enum uint GL_SIGNED_INTENSITY8_NV           = 0x8708;
enum uint GL_DSDT8_NV                       = 0x8709;
enum uint GL_DSDT8_MAG8_NV                  = 0x870A;
enum uint GL_DSDT8_MAG8_INTENSITY8_NV       = 0x870B;
enum uint GL_SIGNED_RGB_UNSIGNED_ALPHA_NV   = 0x870C;
enum uint GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV = 0x870D;
enum uint GL_HI_SCALE_NV                    = 0x870E;
enum uint GL_LO_SCALE_NV                    = 0x870F;
enum uint GL_DS_SCALE_NV                    = 0x8710;
enum uint GL_DT_SCALE_NV                    = 0x8711;
enum uint GL_MAGNITUDE_SCALE_NV             = 0x8712;
enum uint GL_VIBRANCE_SCALE_NV              = 0x8713;
enum uint GL_HI_BIAS_NV                     = 0x8714;
enum uint GL_LO_BIAS_NV                     = 0x8715;
enum uint GL_DS_BIAS_NV                     = 0x8716;
enum uint GL_DT_BIAS_NV                     = 0x8717;
enum uint GL_MAGNITUDE_BIAS_NV              = 0x8718;
enum uint GL_VIBRANCE_BIAS_NV               = 0x8719;
enum uint GL_TEXTURE_BORDER_VALUES_NV       = 0x871A;
enum uint GL_TEXTURE_HI_SIZE_NV             = 0x871B;
enum uint GL_TEXTURE_LO_SIZE_NV             = 0x871C;
enum uint GL_TEXTURE_DS_SIZE_NV             = 0x871D;
enum uint GL_TEXTURE_DT_SIZE_NV             = 0x871E;
enum uint GL_TEXTURE_MAG_SIZE_NV            = 0x871F;

enum uint GL_NV_texture_shader2 = 1;

enum uint GL_NV_texture_shader3 = 1;
enum uint GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV = 0x8850;
enum uint GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV = 0x8851;
enum uint GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV = 0x8852;
enum uint GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV = 0x8853;
enum uint GL_OFFSET_HILO_TEXTURE_2D_NV      = 0x8854;
enum uint GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV = 0x8855;
enum uint GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV = 0x8856;
enum uint GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV = 0x8857;
enum uint GL_DEPENDENT_HILO_TEXTURE_2D_NV   = 0x8858;
enum uint GL_DEPENDENT_RGB_TEXTURE_3D_NV    = 0x8859;
enum uint GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV = 0x885A;
enum uint GL_DOT_PRODUCT_PASS_THROUGH_NV    = 0x885B;
enum uint GL_DOT_PRODUCT_TEXTURE_1D_NV      = 0x885C;
enum uint GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV = 0x885D;
enum uint GL_HILO8_NV                       = 0x885E;
enum uint GL_SIGNED_HILO8_NV                = 0x885F;
enum uint GL_FORCE_BLUE_TO_ONE_NV           = 0x8860;

enum uint GL_NV_vertex_array_range = 1;
enum uint GL_VERTEX_ARRAY_RANGE_NV          = 0x851D;
enum uint GL_VERTEX_ARRAY_RANGE_LENGTH_NV   = 0x851E;
enum uint GL_VERTEX_ARRAY_RANGE_VALID_NV    = 0x851F;
enum uint GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV = 0x8520;
enum uint GL_VERTEX_ARRAY_RANGE_POINTER_NV  = 0x8521;

enum uint GL_NV_vertex_array_range2 = 1;
enum uint GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV = 0x8533;

enum uint GL_NV_vertex_program = 1;
enum uint GL_VERTEX_PROGRAM_NV              = 0x8620;
enum uint GL_VERTEX_STATE_PROGRAM_NV        = 0x8621;
enum uint GL_ATTRIB_ARRAY_SIZE_NV           = 0x8623;
enum uint GL_ATTRIB_ARRAY_STRIDE_NV         = 0x8624;
enum uint GL_ATTRIB_ARRAY_TYPE_NV           = 0x8625;
enum uint GL_CURRENT_ATTRIB_NV              = 0x8626;
enum uint GL_PROGRAM_LENGTH_NV              = 0x8627;
enum uint GL_PROGRAM_STRING_NV              = 0x8628;
enum uint GL_MODELVIEW_PROJECTION_NV        = 0x8629;
enum uint GL_IDENTITY_NV                    = 0x862A;
enum uint GL_INVERSE_NV                     = 0x862B;
enum uint GL_TRANSPOSE_NV                   = 0x862C;
enum uint GL_INVERSE_TRANSPOSE_NV           = 0x862D;
enum uint GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV = 0x862E;
enum uint GL_MAX_TRACK_MATRICES_NV          = 0x862F;
enum uint GL_MATRIX0_NV                     = 0x8630;
enum uint GL_MATRIX1_NV                     = 0x8631;
enum uint GL_MATRIX2_NV                     = 0x8632;
enum uint GL_MATRIX3_NV                     = 0x8633;
enum uint GL_MATRIX4_NV                     = 0x8634;
enum uint GL_MATRIX5_NV                     = 0x8635;
enum uint GL_MATRIX6_NV                     = 0x8636;
enum uint GL_MATRIX7_NV                     = 0x8637;
enum uint GL_CURRENT_MATRIX_STACK_DEPTH_NV  = 0x8640;
enum uint GL_CURRENT_MATRIX_NV              = 0x8641;
enum uint GL_VERTEX_PROGRAM_POINT_SIZE_NV   = 0x8642;
enum uint GL_VERTEX_PROGRAM_TWO_SIDE_NV     = 0x8643;
enum uint GL_PROGRAM_PARAMETER_NV           = 0x8644;
enum uint GL_ATTRIB_ARRAY_POINTER_NV        = 0x8645;
enum uint GL_PROGRAM_TARGET_NV              = 0x8646;
enum uint GL_PROGRAM_RESIDENT_NV            = 0x8647;
enum uint GL_TRACK_MATRIX_NV                = 0x8648;
enum uint GL_TRACK_MATRIX_TRANSFORM_NV      = 0x8649;
enum uint GL_VERTEX_PROGRAM_BINDING_NV      = 0x864A;
enum uint GL_PROGRAM_ERROR_POSITION_NV      = 0x864B;
enum uint GL_VERTEX_ATTRIB_ARRAY0_NV        = 0x8650;
enum uint GL_VERTEX_ATTRIB_ARRAY1_NV        = 0x8651;
enum uint GL_VERTEX_ATTRIB_ARRAY2_NV        = 0x8652;
enum uint GL_VERTEX_ATTRIB_ARRAY3_NV        = 0x8653;
enum uint GL_VERTEX_ATTRIB_ARRAY4_NV        = 0x8654;
enum uint GL_VERTEX_ATTRIB_ARRAY5_NV        = 0x8655;
enum uint GL_VERTEX_ATTRIB_ARRAY6_NV        = 0x8656;
enum uint GL_VERTEX_ATTRIB_ARRAY7_NV        = 0x8657;
enum uint GL_VERTEX_ATTRIB_ARRAY8_NV        = 0x8658;
enum uint GL_VERTEX_ATTRIB_ARRAY9_NV        = 0x8659;
enum uint GL_VERTEX_ATTRIB_ARRAY10_NV       = 0x865A;
enum uint GL_VERTEX_ATTRIB_ARRAY11_NV       = 0x865B;
enum uint GL_VERTEX_ATTRIB_ARRAY12_NV       = 0x865C;
enum uint GL_VERTEX_ATTRIB_ARRAY13_NV       = 0x865D;
enum uint GL_VERTEX_ATTRIB_ARRAY14_NV       = 0x865E;
enum uint GL_VERTEX_ATTRIB_ARRAY15_NV       = 0x865F;
enum uint GL_MAP1_VERTEX_ATTRIB0_4_NV       = 0x8660;
enum uint GL_MAP1_VERTEX_ATTRIB1_4_NV       = 0x8661;
enum uint GL_MAP1_VERTEX_ATTRIB2_4_NV       = 0x8662;
enum uint GL_MAP1_VERTEX_ATTRIB3_4_NV       = 0x8663;
enum uint GL_MAP1_VERTEX_ATTRIB4_4_NV       = 0x8664;
enum uint GL_MAP1_VERTEX_ATTRIB5_4_NV       = 0x8665;
enum uint GL_MAP1_VERTEX_ATTRIB6_4_NV       = 0x8666;
enum uint GL_MAP1_VERTEX_ATTRIB7_4_NV       = 0x8667;
enum uint GL_MAP1_VERTEX_ATTRIB8_4_NV       = 0x8668;
enum uint GL_MAP1_VERTEX_ATTRIB9_4_NV       = 0x8669;
enum uint GL_MAP1_VERTEX_ATTRIB10_4_NV      = 0x866A;
enum uint GL_MAP1_VERTEX_ATTRIB11_4_NV      = 0x866B;
enum uint GL_MAP1_VERTEX_ATTRIB12_4_NV      = 0x866C;
enum uint GL_MAP1_VERTEX_ATTRIB13_4_NV      = 0x866D;
enum uint GL_MAP1_VERTEX_ATTRIB14_4_NV      = 0x866E;
enum uint GL_MAP1_VERTEX_ATTRIB15_4_NV      = 0x866F;
enum uint GL_MAP2_VERTEX_ATTRIB0_4_NV       = 0x8670;
enum uint GL_MAP2_VERTEX_ATTRIB1_4_NV       = 0x8671;
enum uint GL_MAP2_VERTEX_ATTRIB2_4_NV       = 0x8672;
enum uint GL_MAP2_VERTEX_ATTRIB3_4_NV       = 0x8673;
enum uint GL_MAP2_VERTEX_ATTRIB4_4_NV       = 0x8674;
enum uint GL_MAP2_VERTEX_ATTRIB5_4_NV       = 0x8675;
enum uint GL_MAP2_VERTEX_ATTRIB6_4_NV       = 0x8676;
enum uint GL_MAP2_VERTEX_ATTRIB7_4_NV       = 0x8677;
enum uint GL_MAP2_VERTEX_ATTRIB8_4_NV       = 0x8678;
enum uint GL_MAP2_VERTEX_ATTRIB9_4_NV       = 0x8679;
enum uint GL_MAP2_VERTEX_ATTRIB10_4_NV      = 0x867A;
enum uint GL_MAP2_VERTEX_ATTRIB11_4_NV      = 0x867B;
enum uint GL_MAP2_VERTEX_ATTRIB12_4_NV      = 0x867C;
enum uint GL_MAP2_VERTEX_ATTRIB13_4_NV      = 0x867D;
enum uint GL_MAP2_VERTEX_ATTRIB14_4_NV      = 0x867E;
enum uint GL_MAP2_VERTEX_ATTRIB15_4_NV      = 0x867F;

enum uint GL_NV_vertex_program1_1 = 1;

enum uint GL_NV_vertex_program2 = 1;




/*-----------------------------------------------------------------------
 * OML (OpenML)
 *----------------------------------------------------------------------*/

enum uint GL_OML_interlace = 1;
enum uint GL_INTERLACE_OML                  = 0x8980;
enum uint GL_INTERLACE_READ_OML             = 0x8981;

enum uint GL_OML_subsample = 1;
enum uint GL_FORMAT_SUBSAMPLE_24_24_OML     = 0x8982;
enum uint GL_FORMAT_SUBSAMPLE_244_244_OML   = 0x8983;

enum uint GL_OML_resample = 1;
enum uint GL_PACK_RESAMPLE_OML              = 0x8984;
enum uint GL_UNPACK_RESAMPLE_OML            = 0x8985;
enum uint GL_RESAMPLE_REPLICATE_OML         = 0x8986;
enum uint GL_RESAMPLE_ZERO_FILL_OML         = 0x8987;
enum uint GL_RESAMPLE_AVERAGE_OML           = 0x8988;
enum uint GL_RESAMPLE_DECIMATE_OML          = 0x8989;



/*-----------------------------------------------------------------------
 * PGI
 *----------------------------------------------------------------------*/

enum uint GL_PGI_misc_hints = 1;
enum uint GL_PREFER_DOUBLEBUFFER_HINT_PGI   = 0x1A1F8;
enum uint GL_CONSERVE_MEMORY_HINT_PGI       = 0x1A1FD;
enum uint GL_RECLAIM_MEMORY_HINT_PGI        = 0x1A1FE;
enum uint GL_NATIVE_GRAPHICS_HANDLE_PGI     = 0x1A202;
enum uint GL_NATIVE_GRAPHICS_BEGIN_HINT_PGI = 0x1A203;
enum uint GL_NATIVE_GRAPHICS_END_HINT_PGI   = 0x1A204;
enum uint GL_ALWAYS_FAST_HINT_PGI           = 0x1A20C;
enum uint GL_ALWAYS_SOFT_HINT_PGI           = 0x1A20D;
enum uint GL_ALLOW_DRAW_OBJ_HINT_PGI        = 0x1A20E;
enum uint GL_ALLOW_DRAW_WIN_HINT_PGI        = 0x1A20F;
enum uint GL_ALLOW_DRAW_FRG_HINT_PGI        = 0x1A210;
enum uint GL_ALLOW_DRAW_MEM_HINT_PGI        = 0x1A211;
enum uint GL_STRICT_DEPTHFUNC_HINT_PGI      = 0x1A216;
enum uint GL_STRICT_LIGHTING_HINT_PGI       = 0x1A217;
enum uint GL_STRICT_SCISSOR_HINT_PGI        = 0x1A218;
enum uint GL_FULL_STIPPLE_HINT_PGI          = 0x1A219;
enum uint GL_CLIP_NEAR_HINT_PGI             = 0x1A220;
enum uint GL_CLIP_FAR_HINT_PGI              = 0x1A221;
enum uint GL_WIDE_LINE_HINT_PGI             = 0x1A222;
enum uint GL_BACK_NORMALS_HINT_PGI          = 0x1A223;

enum uint GL_PGI_vertex_hints = 1;
enum uint GL_VERTEX_DATA_HINT_PGI           = 0x1A22A;
enum uint GL_VERTEX_CONSISTENT_HINT_PGI     = 0x1A22B;
enum uint GL_MATERIAL_SIDE_HINT_PGI         = 0x1A22C;
enum uint GL_MAX_VERTEX_HINT_PGI            = 0x1A22D;
enum uint GL_COLOR3_BIT_PGI                 = 0x00010000;
enum uint GL_COLOR4_BIT_PGI                 = 0x00020000;
enum uint GL_EDGEFLAG_BIT_PGI               = 0x00040000;
enum uint GL_INDEX_BIT_PGI                  = 0x00080000;
enum uint GL_MAT_AMBIENT_BIT_PGI            = 0x00100000;
enum uint GL_MAT_AMBIENT_AND_DIFFUSE_BIT_PGI = 0x00200000;
enum uint GL_MAT_DIFFUSE_BIT_PGI            = 0x00400000;
enum uint GL_MAT_EMISSION_BIT_PGI           = 0x00800000;
enum uint GL_MAT_COLOR_INDEXES_BIT_PGI      = 0x01000000;
enum uint GL_MAT_SHININESS_BIT_PGI          = 0x02000000;
enum uint GL_MAT_SPECULAR_BIT_PGI           = 0x04000000;
enum uint GL_NORMAL_BIT_PGI                 = 0x08000000;
enum uint GL_TEXCOORD1_BIT_PGI              = 0x10000000;
enum uint GL_TEXCOORD2_BIT_PGI              = 0x20000000;
enum uint GL_TEXCOORD3_BIT_PGI              = 0x40000000;
enum uint GL_TEXCOORD4_BIT_PGI              = 0x80000000;
enum uint GL_VERTEX23_BIT_PGI               = 0x00000004;
enum uint GL_VERTEX4_BIT_PGI                = 0x00000008;



/*-----------------------------------------------------------------------
 * REND
 *----------------------------------------------------------------------*/

enum uint GL_REND_screen_coordinates = 1;
enum uint GL_SCREEN_COORDINATES_REND        = 0x8490;
enum uint GL_INVERTED_SCREEN_W_REND         = 0x8491;



/*-----------------------------------------------------------------------
 * SGI (Silicon Graphics Inc)
 *----------------------------------------------------------------------*/

enum uint GL_SGI_color_matrix = 1;
enum uint GL_COLOR_MATRIX_SGI                   = 0x80B1;
enum uint GL_COLOR_MATRIX_STACK_DEPTH_SGI       = 0x80B2;
enum uint GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI   = 0x80B3;
enum uint GL_POST_COLOR_MATRIX_RED_SCALE_SGI    = 0x80B4;
enum uint GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI  = 0x80B5;
enum uint GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI   = 0x80B6;
enum uint GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI  = 0x80B7;
enum uint GL_POST_COLOR_MATRIX_RED_BIAS_SGI     = 0x80B8;
enum uint GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI   = 0x80B9;
enum uint GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI    = 0x80BA;
enum uint GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI   = 0x80BB;

enum uint GL_SGI_color_table = 1;
enum uint GL_COLOR_TABLE_SGI                         = 0x80D0;
enum uint GL_POST_CONVOLUTION_COLOR_TABLE_SGI        = 0x80D1;
enum uint GL_POST_COLOR_MATRIX_COLOR_TABLE_SGI       = 0x80D2;
enum uint GL_PROXY_COLOR_TABLE_SGI                   = 0x80D3;
enum uint GL_PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI  = 0x80D4;
enum uint GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI = 0x80D5;
enum uint GL_COLOR_TABLE_SCALE_SGI                   = 0x80D6;
enum uint GL_COLOR_TABLE_BIAS_SGI                    = 0x80D7;
enum uint GL_COLOR_TABLE_FORMAT_SGI                  = 0x80D8;
enum uint GL_COLOR_TABLE_WIDTH_SGI                   = 0x80D9;
enum uint GL_COLOR_TABLE_RED_SIZE_SGI                = 0x80DA;
enum uint GL_COLOR_TABLE_GREEN_SIZE_SGI              = 0x80DB;
enum uint GL_COLOR_TABLE_BLUE_SIZE_SGI               = 0x80DC;
enum uint GL_COLOR_TABLE_ALPHA_SIZE_SGI              = 0x80DD;
enum uint GL_COLOR_TABLE_LUMINANCE_SIZE_SGI          = 0x80DE;
enum uint GL_COLOR_TABLE_INTENSITY_SIZE_SGI          = 0x80DF;

enum uint GL_SGI_depth_pass_instrument = 1;
enum uint GL_DEPTH_PASS_INSTRUMENT_SGIX          = 0x8310;
enum uint GL_DEPTH_PASS_INSTRUMENT_COUNTERS_SGIX = 0x8311;
enum uint GL_DEPTH_PASS_INSTRUMENT_MAX_SGIX      = 0x8312;

enum uint GL_SGI_texture_color_table = 1;
enum uint GL_TEXTURE_COLOR_TABLE_SGI        = 0x80BC;
enum uint GL_PROXY_TEXTURE_COLOR_TABLE_SGI  = 0x80BD;

enum uint GL_SGIS_detail_texture = 1;
enum uint GL_DETAIL_TEXTURE_2D_SGIS          = 0x8095;
enum uint GL_DETAIL_TEXTURE_2D_BINDING_SGIS  = 0x8096;
enum uint GL_LINEAR_DETAIL_SGIS              = 0x8097;
enum uint GL_LINEAR_DETAIL_ALPHA_SGIS        = 0x8098;
enum uint GL_LINEAR_DETAIL_COLOR_SGIS        = 0x8099;
enum uint GL_DETAIL_TEXTURE_LEVEL_SGIS       = 0x809A;
enum uint GL_DETAIL_TEXTURE_MODE_SGIS        = 0x809B;
enum uint GL_DETAIL_TEXTURE_FUNC_POINTS_SGIS = 0x809C;

enum uint GL_SGIS_fog_function = 1;
enum uint GL_FOG_FUNC_SGIS                  = 0x812A;
enum uint GL_FOG_FUNC_POINTS_SGIS           = 0x812B;
enum uint GL_MAX_FOG_FUNC_POINTS_SGIS       = 0x812C;

enum uint GL_SGIS_generate_mipmap = 1;
enum uint GL_GENERATE_MIPMAP_SGIS           = 0x8191;
enum uint GL_GENERATE_MIPMAP_HINT_SGIS      = 0x8192;

enum uint GL_SGIS_multisample = 1;
enum uint GL_MULTISAMPLE_SGIS               = 0x809D;
enum uint GL_SAMPLE_ALPHA_TO_MASK_SGIS      = 0x809E;
enum uint GL_SAMPLE_ALPHA_TO_ONE_SGIS       = 0x809F;
enum uint GL_SAMPLE_MASK_SGIS               = 0x80A0;
enum uint GL_1PASS_SGIS                     = 0x80A1;
enum uint GL_2PASS_0_SGIS                   = 0x80A2;
enum uint GL_2PASS_1_SGIS                   = 0x80A3;
enum uint GL_4PASS_0_SGIS                   = 0x80A4;
enum uint GL_4PASS_1_SGIS                   = 0x80A5;
enum uint GL_4PASS_2_SGIS                   = 0x80A6;
enum uint GL_4PASS_3_SGIS                   = 0x80A7;
enum uint GL_SAMPLE_BUFFERS_SGIS            = 0x80A8;
enum uint GL_SAMPLES_SGIS                   = 0x80A9;
enum uint GL_SAMPLE_MASK_VALUE_SGIS         = 0x80AA;
enum uint GL_SAMPLE_MASK_INVERT_SGIS        = 0x80AB;
enum uint GL_SAMPLE_PATTERN_SGIS            = 0x80AC;

enum uint GL_SGIS_pixel_texture = 1;
enum uint GL_PIXEL_TEXTURE_SGIS               = 0x8353;
enum uint GL_PIXEL_FRAGMENT_RGB_SOURCE_SGIS   = 0x8354;
enum uint GL_PIXEL_FRAGMENT_ALPHA_SOURCE_SGIS = 0x8355;
enum uint GL_PIXEL_GROUP_COLOR_SGIS           = 0x8356;

enum uint GL_SGIS_point_line_texgen = 1;
enum uint GL_EYE_DISTANCE_TO_POINT_SGIS     = 0x81F0;
enum uint GL_OBJECT_DISTANCE_TO_POINT_SGIS  = 0x81F1;
enum uint GL_EYE_DISTANCE_TO_LINE_SGIS      = 0x81F2;
enum uint GL_OBJECT_DISTANCE_TO_LINE_SGIS   = 0x81F3;
enum uint GL_EYE_POINT_SGIS                 = 0x81F4;
enum uint GL_OBJECT_POINT_SGIS              = 0x81F5;
enum uint GL_EYE_LINE_SGIS                  = 0x81F6;
enum uint GL_OBJECT_LINE_SGIS               = 0x81F7;

enum uint GL_SGIS_sharpen_texture = 1;
enum uint GL_LINEAR_SHARPEN_SGIS              = 0x80AD;
enum uint GL_LINEAR_SHARPEN_ALPHA_SGIS        = 0x80AE;
enum uint GL_LINEAR_SHARPEN_COLOR_SGIS        = 0x80AF;
enum uint GL_SHARPEN_TEXTURE_FUNC_POINTS_SGIS = 0x80B0;

enum uint GL_SGIS_texture_border_clamp = 1;
enum uint GL_CLAMP_TO_BORDER_SGIS           = 0x812D;

enum uint GL_SGIS_texture_color_mask = 1;
enum uint GL_TEXTURE_COLOR_WRITEMASK_SGIS   = 0x81EF;

enum uint GL_SGIS_texture_edge_clamp = 1;
enum uint GL_CLAMP_TO_EDGE_SGIS             = 0x812F;

enum uint GL_SGIS_texture_filter4 = 1;
enum uint GL_FILTER4_SGIS                   = 0x8146;
enum uint GL_TEXTURE_FILTER4_SIZE_SGIS      = 0x8147;

enum uint GL_SGIS_texture_lod = 1;
enum uint GL_TEXTURE_MIN_LOD_SGIS           = 0x813A;
enum uint GL_TEXTURE_MAX_LOD_SGIS           = 0x813B;
enum uint GL_TEXTURE_BASE_LEVEL_SGIS        = 0x813C;
enum uint GL_TEXTURE_MAX_LEVEL_SGIS         = 0x813D;

enum uint GL_SGIS_texture_select = 1;
enum uint GL_DUAL_ALPHA4_SGIS               = 0x8110;
enum uint GL_DUAL_ALPHA8_SGIS               = 0x8111;
enum uint GL_DUAL_ALPHA12_SGIS              = 0x8112;
enum uint GL_DUAL_ALPHA16_SGIS              = 0x8113;
enum uint GL_DUAL_LUMINANCE4_SGIS           = 0x8114;
enum uint GL_DUAL_LUMINANCE8_SGIS           = 0x8115;
enum uint GL_DUAL_LUMINANCE12_SGIS          = 0x8116;
enum uint GL_DUAL_LUMINANCE16_SGIS          = 0x8117;
enum uint GL_DUAL_INTENSITY4_SGIS           = 0x8118;
enum uint GL_DUAL_INTENSITY8_SGIS           = 0x8119;
enum uint GL_DUAL_INTENSITY12_SGIS          = 0x811A;
enum uint GL_DUAL_INTENSITY16_SGIS          = 0x811B;
enum uint GL_DUAL_LUMINANCE_ALPHA4_SGIS     = 0x811C;
enum uint GL_DUAL_LUMINANCE_ALPHA8_SGIS     = 0x811D;
enum uint GL_QUAD_ALPHA4_SGIS               = 0x811E;
enum uint GL_QUAD_ALPHA8_SGIS               = 0x811F;
enum uint GL_QUAD_LUMINANCE4_SGIS           = 0x8120;
enum uint GL_QUAD_LUMINANCE8_SGIS           = 0x8121;
enum uint GL_QUAD_INTENSITY4_SGIS           = 0x8122;
enum uint GL_QUAD_INTENSITY8_SGIS           = 0x8123;
enum uint GL_DUAL_TEXTURE_SELECT_SGIS       = 0x8124;
enum uint GL_QUAD_TEXTURE_SELECT_SGIS       = 0x8125;

enum uint GL_SGIS_texture4D = 1;
enum uint GL_PACK_SKIP_VOLUMES_SGIS         = 0x8130;
enum uint GL_PACK_IMAGE_DEPTH_SGIS          = 0x8131;
enum uint GL_UNPACK_SKIP_VOLUMES_SGIS       = 0x8132;
enum uint GL_UNPACK_IMAGE_DEPTH_SGIS        = 0x8133;
enum uint GL_TEXTURE_4D_SGIS                = 0x8134;
enum uint GL_PROXY_TEXTURE_4D_SGIS          = 0x8135;
enum uint GL_TEXTURE_4DSIZE_SGIS            = 0x8136;
enum uint GL_TEXTURE_WRAP_Q_SGIS            = 0x8137;
enum uint GL_MAX_4D_TEXTURE_SIZE_SGIS       = 0x8138;
enum uint GL_TEXTURE_4D_BINDING_SGIS        = 0x814F;

enum uint GL_SGIX_async = 1;
enum uint GL_ASYNC_MARKER_SGIX              = 0x8329;

enum uint GL_SGIX_async_histogram = 1;
enum uint GL_ASYNC_HISTOGRAM_SGIX           = 0x832C;
enum uint GL_MAX_ASYNC_HISTOGRAM_SGIX       = 0x832D;

enum uint GL_SGIX_async_pixel = 1;
enum uint GL_ASYNC_TEX_IMAGE_SGIX           = 0x835C;
enum uint GL_ASYNC_DRAW_PIXELS_SGIX         = 0x835D;
enum uint GL_ASYNC_READ_PIXELS_SGIX         = 0x835E;
enum uint GL_MAX_ASYNC_TEX_IMAGE_SGIX       = 0x835F;
enum uint GL_MAX_ASYNC_DRAW_PIXELS_SGIX     = 0x8360;
enum uint GL_MAX_ASYNC_READ_PIXELS_SGIX     = 0x8361;

enum uint GL_SGIX_blend_alpha_minmax = 1;
enum uint GL_ALPHA_MIN_SGIX                 = 0x8320;
enum uint GL_ALPHA_MAX_SGIX                 = 0x8321;

enum uint GL_SGIX_calligraphic_fragment = 1;
enum uint GL_CALLIGRAPHIC_FRAGMENT_SGIX     = 0x8183;

enum uint GL_SGIX_clipmap = 1;
enum uint GL_LINEAR_CLIPMAP_LINEAR_SGIX         = 0x8170;
enum uint GL_TEXTURE_CLIPMAP_CENTER_SGIX        = 0x8171;
enum uint GL_TEXTURE_CLIPMAP_FRAME_SGIX         = 0x8172;
enum uint GL_TEXTURE_CLIPMAP_OFFSET_SGIX        = 0x8173;
enum uint GL_TEXTURE_CLIPMAP_VIRTUAL_DEPTH_SGIX = 0x8174;
enum uint GL_TEXTURE_CLIPMAP_LOD_OFFSET_SGIX    = 0x8175;
enum uint GL_TEXTURE_CLIPMAP_DEPTH_SGIX         = 0x8176;
enum uint GL_MAX_CLIPMAP_DEPTH_SGIX             = 0x8177;
enum uint GL_MAX_CLIPMAP_VIRTUAL_DEPTH_SGIX     = 0x8178;
enum uint GL_NEAREST_CLIPMAP_NEAREST_SGIX       = 0x844D;
enum uint GL_NEAREST_CLIPMAP_LINEAR_SGIX        = 0x844E;
enum uint GL_LINEAR_CLIPMAP_NEAREST_SGIX        = 0x844F;

enum uint GL_SGIX_convolution_accuracy = 1;
enum uint GL_CONVOLUTION_HINT_SGIX          = 0x8316;

enum uint GL_SGIX_depth_texture = 1;
enum uint GL_DEPTH_COMPONENT16_SGIX         = 0x81A5;
enum uint GL_DEPTH_COMPONENT24_SGIX         = 0x81A6;
enum uint GL_DEPTH_COMPONENT32_SGIX         = 0x81A7;

enum uint GL_SGIX_flush_raster = 1;

enum uint GL_SGIX_fog_offset = 1;
enum uint GL_FOG_OFFSET_SGIX                = 0x8198;
enum uint GL_FOG_OFFSET_VALUE_SGIX          = 0x8199;

enum uint GL_SGIX_fog_scale = 1;
enum uint GL_FOG_SCALE_SGIX                 = 0x81FC;
enum uint GL_FOG_SCALE_VALUE_SGIX           = 0x81FD;

enum uint GL_SGIX_fragment_lighting = 1;
enum uint GL_FRAGMENT_LIGHTING_SGIX         = 0x8400;
enum uint GL_FRAGMENT_COLOR_MATERIAL_SGIX   = 0x8401;
enum uint GL_FRAGMENT_COLOR_MATERIAL_FACE_SGIX = 0x8402;
enum uint GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_SGIX = 0x8403;
enum uint GL_MAX_FRAGMENT_LIGHTS_SGIX       = 0x8404;
enum uint GL_MAX_ACTIVE_LIGHTS_SGIX         = 0x8405;
enum uint GL_CURRENT_RASTER_NORMAL_SGIX     = 0x8406;
enum uint GL_LIGHT_ENV_MODE_SGIX            = 0x8407;
enum uint GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_SGIX = 0x8408;
enum uint GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_SGIX = 0x8409;
enum uint GL_FRAGMENT_LIGHT_MODEL_AMBIENT_SGIX = 0x840A;
enum uint GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_SGIX = 0x840B;
enum uint GL_FRAGMENT_LIGHT0_SGIX           = 0x840C;
enum uint GL_FRAGMENT_LIGHT1_SGIX           = 0x840D;
enum uint GL_FRAGMENT_LIGHT2_SGIX           = 0x840E;
enum uint GL_FRAGMENT_LIGHT3_SGIX           = 0x840F;
enum uint GL_FRAGMENT_LIGHT4_SGIX           = 0x8410;
enum uint GL_FRAGMENT_LIGHT5_SGIX           = 0x8411;
enum uint GL_FRAGMENT_LIGHT6_SGIX           = 0x8412;
enum uint GL_FRAGMENT_LIGHT7_SGIX           = 0x8413;

enum uint GL_SGIX_framezoom = 1;
enum uint GL_FRAMEZOOM_SGIX                 = 0x818B;
enum uint GL_FRAMEZOOM_FACTOR_SGIX          = 0x818C;
enum uint GL_MAX_FRAMEZOOM_FACTOR_SGIX      = 0x818D;

enum uint GL_SGIX_impact_pixel_texture = 1;
enum uint GL_PIXEL_TEX_GEN_Q_CEILING_SGIX        = 0x8184;
enum uint GL_PIXEL_TEX_GEN_Q_ROUND_SGIX          = 0x8185;
enum uint GL_PIXEL_TEX_GEN_Q_FLOOR_SGIX          = 0x8186;
enum uint GL_PIXEL_TEX_GEN_ALPHA_REPLACE_SGIX    = 0x8187;
enum uint GL_PIXEL_TEX_GEN_ALPHA_NO_REPLACE_SGIX = 0x8188;
enum uint GL_PIXEL_TEX_GEN_ALPHA_LS_SGIX         = 0x8189;
enum uint GL_PIXEL_TEX_GEN_ALPHA_MS_SGIX         = 0x818A;

enum uint GL_SGIX_instruments = 1;
enum uint GL_INSTRUMENT_BUFFER_POINTER_SGIX = 0x8180;
enum uint GL_INSTRUMENT_MEASUREMENTS_SGIX   = 0x8181;

enum uint GL_SGIX_interlace = 1;
enum uint GL_INTERLACE_SGIX                 = 0x8094;

enum uint GL_SGIX_ir_instrument1 = 1;
enum uint GL_IR_INSTRUMENT1_SGIX            = 0x817F;

enum uint GL_SGIX_list_priority = 1;
enum uint GL_LIST_PRIORITY_SGIX             = 0x8182;

enum uint GL_SGIX_pixel_texture = 1;
enum uint GL_PIXEL_TEX_GEN_SGIX             = 0x8139;
enum uint GL_PIXEL_TEX_GEN_MODE_SGIX        = 0x832B;

enum uint GL_SGIX_pixel_tiles = 1;
enum uint GL_PIXEL_TILE_BEST_ALIGNMENT_SGIX  = 0x813E;
enum uint GL_PIXEL_TILE_CACHE_INCREMENT_SGIX = 0x813F;
enum uint GL_PIXEL_TILE_WIDTH_SGIX           = 0x8140;
enum uint GL_PIXEL_TILE_HEIGHT_SGIX          = 0x8141;
enum uint GL_PIXEL_TILE_GRID_WIDTH_SGIX      = 0x8142;
enum uint GL_PIXEL_TILE_GRID_HEIGHT_SGIX     = 0x8143;
enum uint GL_PIXEL_TILE_GRID_DEPTH_SGIX      = 0x8144;
enum uint GL_PIXEL_TILE_CACHE_SIZE_SGIX      = 0x8145;

enum uint GL_SGIX_polynomial_ffd = 1;
enum uint GL_GEOMETRY_DEFORMATION_SGIX      = 0x8194;
enum uint GL_TEXTURE_DEFORMATION_SGIX       = 0x8195;
enum uint GL_DEFORMATIONS_MASK_SGIX         = 0x8196;
enum uint GL_MAX_DEFORMATION_ORDER_SGIX     = 0x8197;

enum uint GL_SGIX_reference_plane = 1;
enum uint GL_REFERENCE_PLANE_SGIX           = 0x817D;
enum uint GL_REFERENCE_PLANE_EQUATION_SGIX  = 0x817E;

enum uint GL_SGIX_resample = 1;
enum uint GL_PACK_RESAMPLE_SGIX             = 0x842C;
enum uint GL_UNPACK_RESAMPLE_SGIX           = 0x842D;
enum uint GL_RESAMPLE_REPLICATE_SGIX        = 0x842E;
enum uint GL_RESAMPLE_ZERO_FILL_SGIX        = 0x842F;
enum uint GL_RESAMPLE_DECIMATE_SGIX         = 0x8430;

enum uint GL_SGIX_scalebias_hint = 1;
enum uint GL_SCALEBIAS_HINT_SGIX            = 0x8322;

enum uint GL_SGIX_shadow = 1;
enum uint GL_TEXTURE_COMPARE_SGIX           = 0x819A;
enum uint GL_TEXTURE_COMPARE_OPERATOR_SGIX  = 0x819B;
enum uint GL_TEXTURE_LEQUAL_R_SGIX          = 0x819C;
enum uint GL_TEXTURE_GEQUAL_R_SGIX          = 0x819D;

enum uint GL_SGIX_shadow_ambient = 1;
enum uint GL_SHADOW_AMBIENT_SGIX            = 0x80BF;

enum uint GL_SGIX_sprite = 1;
enum uint GL_SPRITE_SGIX                    = 0x8148;
enum uint GL_SPRITE_MODE_SGIX               = 0x8149;
enum uint GL_SPRITE_AXIS_SGIX               = 0x814A;
enum uint GL_SPRITE_TRANSLATION_SGIX        = 0x814B;
enum uint GL_SPRITE_AXIAL_SGIX              = 0x814C;
enum uint GL_SPRITE_OBJECT_ALIGNED_SGIX     = 0x814D;
enum uint GL_SPRITE_EYE_ALIGNED_SGIX        = 0x814E;

enum uint GL_SGIX_subsample = 1;
enum uint GL_PACK_SUBSAMPLE_RATE_SGIX       = 0x85A0;
enum uint GL_UNPACK_SUBSAMPLE_RATE_SGIX     = 0x85A1;
enum uint GL_PIXEL_SUBSAMPLE_4444_SGIX      = 0x85A2;
enum uint GL_PIXEL_SUBSAMPLE_2424_SGIX      = 0x85A3;
enum uint GL_PIXEL_SUBSAMPLE_4242_SGIX      = 0x85A4;

enum uint GL_SGIX_tag_sample_buffer = 1;

enum uint GL_SGIX_texture_add_env = 1;
enum uint GL_TEXTURE_ENV_BIAS_SGIX          = 0x80BE;

enum uint GL_SGIX_texture_coordinate_clamp = 1;
enum uint GL_TEXTURE_MAX_CLAMP_S_SGIX       = 0x8369;
enum uint GL_TEXTURE_MAX_CLAMP_T_SGIX       = 0x836A;
enum uint GL_TEXTURE_MAX_CLAMP_R_SGIX       = 0x836B;

enum uint GL_SGIX_texture_lod_bias = 1;
enum uint GL_TEXTURE_LOD_BIAS_S_SGIX        = 0x818E;
enum uint GL_TEXTURE_LOD_BIAS_T_SGIX        = 0x818F;
enum uint GL_TEXTURE_LOD_BIAS_R_SGIX        = 0x8190;

enum uint GL_SGIX_texture_multi_buffer = 1;
enum uint GL_TEXTURE_MULTI_BUFFER_HINT_SGIX = 0x812E;

enum uint GL_SGIX_texture_scale_bias = 1;
enum uint GL_POST_TEXTURE_FILTER_BIAS_SGIX        = 0x8179;
enum uint GL_POST_TEXTURE_FILTER_SCALE_SGIX       = 0x817A;
enum uint GL_POST_TEXTURE_FILTER_BIAS_RANGE_SGIX  = 0x817B;
enum uint GL_POST_TEXTURE_FILTER_SCALE_RANGE_SGIX = 0x817C;

enum uint GL_SGIX_vertex_preclip = 1;
enum uint GL_VERTEX_PRECLIP_SGIX            = 0x83EE;
enum uint GL_VERTEX_PRECLIP_HINT_SGIX       = 0x83EF;

enum uint GL_SGIX_ycrcb = 1;
enum uint GL_YCRCB_422_SGIX                 = 0x81BB;
enum uint GL_YCRCB_444_SGIX                 = 0x81BC;

enum uint GL_SGIX_ycrcb_subsample = 1;

enum uint GL_SGIX_ycrcba = 1;
enum uint GL_YCRCB_SGIX                     = 0x8318;
enum uint GL_YCRCBA_SGIX                    = 0x8319;



/*-----------------------------------------------------------------------
 * SUN
 *----------------------------------------------------------------------*/

enum uint GL_SUN_convolution_border_modes = 1;
enum uint GL_WRAP_BORDER_SUN                = 0x81D4;

enum uint GL_SUN_global_alpha = 1;
enum uint GL_GLOBAL_ALPHA_SUN               = 0x81D9;
enum uint GL_GLOBAL_ALPHA_FACTOR_SUN        = 0x81DA;

enum uint GL_SUN_mesh_array = 1;
enum uint GL_QUAD_MESH_SUN                  = 0x8614;
enum uint GL_TRIANGLE_MESH_SUN              = 0x8615;

enum uint GL_SUN_slice_accum = 1;
enum uint GL_SLICE_ACCUM_SUN                = 0x85CC;

enum uint GL_SUN_triangle_list = 1;
enum uint GL_RESTART_SUN                        = 0x0001;
enum uint GL_REPLACE_MIDDLE_SUN                 = 0x0002;
enum uint GL_REPLACE_OLDEST_SUN                 = 0x0003;
enum uint GL_TRIANGLE_LIST_SUN                  = 0x81D7;
enum uint GL_REPLACEMENT_CODE_SUN               = 0x81D8;
enum uint GL_REPLACEMENT_CODE_ARRAY_SUN         = 0x85C0;
enum uint GL_REPLACEMENT_CODE_ARRAY_TYPE_SUN    = 0x85C1;
enum uint GL_REPLACEMENT_CODE_ARRAY_STRIDE_SUN  = 0x85C2;
enum uint GL_REPLACEMENT_CODE_ARRAY_POINTER_SUN = 0x85C3;
enum uint GL_R1UI_V3F_SUN                       = 0x85C4;
enum uint GL_R1UI_C4UB_V3F_SUN                  = 0x85C5;
enum uint GL_R1UI_C3F_V3F_SUN                   = 0x85C6;
enum uint GL_R1UI_N3F_V3F_SUN                   = 0x85C7;
enum uint GL_R1UI_C4F_N3F_V3F_SUN               = 0x85C8;
enum uint GL_R1UI_T2F_V3F_SUN                   = 0x85C9;
enum uint GL_R1UI_T2F_N3F_V3F_SUN               = 0x85CA;
enum uint GL_R1UI_T2F_C4F_N3F_V3F_SUN           = 0x85CB;

enum uint GL_SUN_vertex = 1;

enum uint GL_SUNX_constant_data = 1;
enum uint GL_UNPACK_CONSTANT_DATA_SUNX      = 0x81D5;
enum uint GL_TEXTURE_CONSTANT_DATA_SUNX     = 0x81D6;



/*-----------------------------------------------------------------------
 * WIN (Microsoft)
 *----------------------------------------------------------------------*/

enum uint GL_WIN_phong_shading = 1;
enum uint GL_PHONG_WIN                      = 0x80EA;
enum uint GL_PHONG_HINT_WIN                 = 0x80EB;

enum uint GL_WIN_specular_fog = 1;
enum uint GL_FOG_SPECULAR_TEXTURE_WIN       = 0x80EC;



/************************************************************************
 *
 * Extension function pointer types
 *
 * Note: Proper OpenGL extension checking must be performed to use these.
 *
 ************************************************************************/

/* GL_ARB_multitexture */
alias PFNGLACTIVETEXTUREARBPROC = void function(GLenum texture);
alias PFNGLCLIENTACTIVETEXTUREARBPROC = void function(GLenum texture);
alias PFNGLMULTITEXCOORD1DARBPROC = void function(GLenum target, GLdouble s);
alias PFNGLMULTITEXCOORD1DVARBPROC = void function(GLenum target, GLdouble *v);
alias PFNGLMULTITEXCOORD1FARBPROC = void function(GLenum target, GLfloat s);
alias PFNGLMULTITEXCOORD1FVARBPROC = void function(GLenum target, GLfloat *v);
alias PFNGLMULTITEXCOORD1IARBPROC = void function(GLenum target, GLint s);
alias PFNGLMULTITEXCOORD1IVARBPROC = void function(GLenum target, GLint *v);
alias PFNGLMULTITEXCOORD1SARBPROC = void function(GLenum target, GLshort s);
alias PFNGLMULTITEXCOORD1SVARBPROC = void function(GLenum target, GLshort *v);
alias PFNGLMULTITEXCOORD2DARBPROC = void function(GLenum target, GLdouble s, GLdouble t);
alias PFNGLMULTITEXCOORD2DVARBPROC = void function(GLenum target, GLdouble *v);
alias PFNGLMULTITEXCOORD2FARBPROC = void function(GLenum target, GLfloat s, GLfloat t);
alias PFNGLMULTITEXCOORD2FVARBPROC = void function(GLenum target, GLfloat *v);
alias PFNGLMULTITEXCOORD2IARBPROC = void function(GLenum target, GLint s, GLint t);
alias PFNGLMULTITEXCOORD2IVARBPROC = void function(GLenum target, GLint *v);
alias PFNGLMULTITEXCOORD2SARBPROC = void function(GLenum target, GLshort s, GLshort t);
alias PFNGLMULTITEXCOORD2SVARBPROC = void function(GLenum target, GLshort *v);
alias PFNGLMULTITEXCOORD3DARBPROC = void function(GLenum target, GLdouble s, GLdouble t, GLdouble r);
alias PFNGLMULTITEXCOORD3DVARBPROC = void function(GLenum target, GLdouble *v);
alias PFNGLMULTITEXCOORD3FARBPROC = void function(GLenum target, GLfloat s, GLfloat t, GLfloat r);
alias PFNGLMULTITEXCOORD3FVARBPROC = void function(GLenum target, GLfloat *v);
alias PFNGLMULTITEXCOORD3IARBPROC = void function(GLenum target, GLint s, GLint t, GLint r);
alias PFNGLMULTITEXCOORD3IVARBPROC = void function(GLenum target, GLint *v);
alias PFNGLMULTITEXCOORD3SARBPROC = void function(GLenum target, GLshort s, GLshort t, GLshort r);
alias PFNGLMULTITEXCOORD3SVARBPROC = void function(GLenum target, GLshort *v);
alias PFNGLMULTITEXCOORD4DARBPROC = void function(GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q);
alias PFNGLMULTITEXCOORD4DVARBPROC = void function(GLenum target, GLdouble *v);
alias PFNGLMULTITEXCOORD4FARBPROC = void function(GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q);
alias PFNGLMULTITEXCOORD4FVARBPROC = void function(GLenum target, GLfloat *v);
alias PFNGLMULTITEXCOORD4IARBPROC = void function(GLenum target, GLint s, GLint t, GLint r, GLint q);
alias PFNGLMULTITEXCOORD4IVARBPROC = void function(GLenum target, GLint *v);
alias PFNGLMULTITEXCOORD4SARBPROC = void function(GLenum target, GLshort s, GLshort t, GLshort r, GLshort q);
alias PFNGLMULTITEXCOORD4SVARBPROC = void function(GLenum target, GLshort *v);

/* GL_ARB_transpose_matrix */
alias PFNGLLOADTRANSPOSEMATRIXFARBPROC = void function(GLfloat *m);
alias PFNGLLOADTRANSPOSEMATRIXDARBPROC = void function(GLdouble *m);
alias PFNGLMULTTRANSPOSEMATRIXFARBPROC = void function(GLfloat *m);
alias PFNGLMULTTRANSPOSEMATRIXDARBPROC = void function(GLdouble *m);

/* GL_ARB_multisample */
alias PFNGLSAMPLECOVERAGEARBPROC = void function(GLclampf value, GLboolean invert);

/* GL_ARB_texture_compression */
alias PFNGLCOMPRESSEDTEXIMAGE3DARBPROC = void function(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, GLvoid *data);
alias PFNGLCOMPRESSEDTEXIMAGE2DARBPROC = void function(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, GLvoid *data);
alias PFNGLCOMPRESSEDTEXIMAGE1DARBPROC = void function(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, GLvoid *data);
alias PFNGLCOMPRESSEDTEXSUBIMAGE3DARBPROC = void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, GLvoid *data);
alias PFNGLCOMPRESSEDTEXSUBIMAGE2DARBPROC = void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, GLvoid *data);
alias PFNGLCOMPRESSEDTEXSUBIMAGE1DARBPROC = void function(GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, GLvoid *data);
alias PFNGLGETCOMPRESSEDTEXIMAGEARBPROC = void function(GLenum target, GLint level, void *img);

/* GL_ARB_point_parameters */
alias PFNGLPOINTPARAMETERFARBPROC = void function(GLenum pname, GLfloat param);
alias PFNGLPOINTPARAMETERFVARBPROC = void function(GLenum pname, GLfloat *params);

/* GL_ARB_vertex_blend */
alias PFNGLWEIGHTBVARBPROC = void function(GLint size, GLbyte *weights);
alias PFNGLWEIGHTSVARBPROC = void function(GLint size, GLshort *weights);
alias PFNGLWEIGHTIVARBPROC = void function(GLint size, GLint *weights);
alias PFNGLWEIGHTFVARBPROC = void function(GLint size, GLfloat *weights);
alias PFNGLWEIGHTDVARBPROC = void function(GLint size, GLdouble *weights);
alias PFNGLWEIGHTUBVARBPROC = void function(GLint size, GLubyte *weights);
alias PFNGLWEIGHTUSVARBPROC = void function(GLint size, GLushort *weights);
alias PFNGLWEIGHTUIVARBPROC = void function(GLint size, GLuint *weights);
alias PFNGLWEIGHTPOINTERARBPROC = void function(GLint size, GLenum type, GLsizei stride, GLvoid *pointer);
alias PFNGLVERTEXBLENDARBPROC = void function(GLint count);

/* GL_ARB_matrix_palette */
alias PFNGLCURRENTPALETTEMATRIXARBPROC = void function(GLint index);
alias PFNGLMATRIXINDEXUBVARBPROC = void function(GLint size, GLubyte *indices);
alias PFNGLMATRIXINDEXUSVARBPROC = void function(GLint size, GLushort *indices);
alias PFNGLMATRIXINDEXUIVARBPROC = void function(GLint size, GLuint *indices);
alias PFNGLMATRIXINDEXPOINTERARBPROC = void function(GLint size, GLenum type, GLsizei stride, GLvoid *pointer);

/* GL_ARB_window_pos */
alias PFNGLWINDOWPOS2DARBPROC = void function(GLdouble x, GLdouble y);
alias PFNGLWINDOWPOS2DVARBPROC = void function(GLdouble *v);
alias PFNGLWINDOWPOS2FARBPROC = void function(GLfloat x, GLfloat y);
alias PFNGLWINDOWPOS2FVARBPROC = void function(GLfloat *v);
alias PFNGLWINDOWPOS2IARBPROC = void function(GLint x, GLint y);
alias PFNGLWINDOWPOS2IVARBPROC = void function(GLint *v);
alias PFNGLWINDOWPOS2SARBPROC = void function(GLshort x, GLshort y);
alias PFNGLWINDOWPOS2SVARBPROC = void function(GLshort *v);
alias PFNGLWINDOWPOS3DARBPROC = void function(GLdouble x, GLdouble y, GLdouble z);
alias PFNGLWINDOWPOS3DVARBPROC = void function(GLdouble *v);
alias PFNGLWINDOWPOS3FARBPROC = void function(GLfloat x, GLfloat y, GLfloat z);
alias PFNGLWINDOWPOS3FVARBPROC = void function(GLfloat *v);
alias PFNGLWINDOWPOS3IARBPROC = void function(GLint x, GLint y, GLint z);
alias PFNGLWINDOWPOS3IVARBPROC = void function(GLint *v);
alias PFNGLWINDOWPOS3SARBPROC = void function(GLshort x, GLshort y, GLshort z);
alias PFNGLWINDOWPOS3SVARBPROC = void function(GLshort *v);

/* GL_ARB_vertex_program */
alias PFNGLVERTEXATTRIB1SARBPROC = void function(GLuint index, GLshort x);
alias PFNGLVERTEXATTRIB1FARBPROC = void function(GLuint index, GLfloat x);
alias PFNGLVERTEXATTRIB1DARBPROC = void function(GLuint index, GLdouble x);
alias PFNGLVERTEXATTRIB2SARBPROC = void function(GLuint index, GLshort x, GLshort y);
alias PFNGLVERTEXATTRIB2FARBPROC = void function(GLuint index, GLfloat x, GLfloat y);
alias PFNGLVERTEXATTRIB2DARBPROC = void function(GLuint index, GLdouble x, GLdouble y);
alias PFNGLVERTEXATTRIB3SARBPROC = void function(GLuint index, GLshort x, GLshort y, GLshort z);
alias PFNGLVERTEXATTRIB3FARBPROC = void function(GLuint index, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLVERTEXATTRIB3DARBPROC = void function(GLuint index, GLdouble x, GLdouble y, GLdouble z);
alias PFNGLVERTEXATTRIB4SARBPROC = void function(GLuint index, GLshort x, GLshort y, GLshort z, GLshort w);
alias PFNGLVERTEXATTRIB4FARBPROC = void function(GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
alias PFNGLVERTEXATTRIB4DARBPROC = void function(GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
alias PFNGLVERTEXATTRIB4NUBARBPROC = void function(GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w);
alias PFNGLVERTEXATTRIB1SVARBPROC = void function(GLuint index, GLshort *v);
alias PFNGLVERTEXATTRIB1FVARBPROC = void function(GLuint index, GLfloat *v);
alias PFNGLVERTEXATTRIB1DVARBPROC = void function(GLuint index, GLdouble *v);
alias PFNGLVERTEXATTRIB2SVARBPROC = void function(GLuint index, GLshort *v);
alias PFNGLVERTEXATTRIB2FVARBPROC = void function(GLuint index, GLfloat *v);
alias PFNGLVERTEXATTRIB2DVARBPROC = void function(GLuint index, GLdouble *v);
alias PFNGLVERTEXATTRIB3SVARBPROC = void function(GLuint index, GLshort *v);
alias PFNGLVERTEXATTRIB3FVARBPROC = void function(GLuint index, GLfloat *v);
alias PFNGLVERTEXATTRIB3DVARBPROC = void function(GLuint index, GLdouble *v);
alias PFNGLVERTEXATTRIB4BVARBPROC = void function(GLuint index, GLbyte *v);
alias PFNGLVERTEXATTRIB4SVARBPROC = void function(GLuint index, GLshort *v);
alias PFNGLVERTEXATTRIB4IVARBPROC = void function(GLuint index, GLint *v);
alias PFNGLVERTEXATTRIB4UBVARBPROC = void function(GLuint index, GLubyte *v);
alias PFNGLVERTEXATTRIB4USVARBPROC = void function(GLuint index, GLushort *v);
alias PFNGLVERTEXATTRIB4UIVARBPROC = void function(GLuint index, GLuint *v);
alias PFNGLVERTEXATTRIB4FVARBPROC = void function(GLuint index, GLfloat *v);
alias PFNGLVERTEXATTRIB4DVARBPROC = void function(GLuint index, GLdouble *v);
alias PFNGLVERTEXATTRIB4NBVARBPROC = void function(GLuint index, GLbyte *v);
alias PFNGLVERTEXATTRIB4NSVARBPROC = void function(GLuint index, GLshort *v);
alias PFNGLVERTEXATTRIB4NIVARBPROC = void function(GLuint index, GLint *v);
alias PFNGLVERTEXATTRIB4NUBVARBPROC = void function(GLuint index, GLubyte *v);
alias PFNGLVERTEXATTRIB4NUSVARBPROC = void function(GLuint index, GLushort *v);
alias PFNGLVERTEXATTRIB4NUIVARBPROC = void function(GLuint index, GLuint *v);
alias PFNGLVERTEXATTRIBPOINTERARBPROC = void function(GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, GLvoid *pointer);
alias PFNGLENABLEVERTEXATTRIBARRAYARBPROC = void function(GLuint index);
alias PFNGLDISABLEVERTEXATTRIBARRAYARBPROC = void function(GLuint index);
alias PFNGLPROGRAMSTRINGARBPROC = void function(GLenum target, GLenum format, GLsizei len, GLvoid *string);
alias PFNGLBINDPROGRAMARBPROC = void function(GLenum target, GLuint program);
alias PFNGLDELETEPROGRAMSARBPROC = void function(GLsizei n, GLuint *programs);
alias PFNGLGENPROGRAMSARBPROC = void function(GLsizei n, GLuint *programs);
alias PFNGLPROGRAMENVPARAMETER4DARBPROC = void function(GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
alias PFNGLPROGRAMENVPARAMETER4DVARBPROC = void function(GLenum target, GLuint index, GLdouble *params);
alias PFNGLPROGRAMENVPARAMETER4FARBPROC = void function(GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
alias PFNGLPROGRAMENVPARAMETER4FVARBPROC = void function(GLenum target, GLuint index, GLfloat *params);
alias PFNGLPROGRAMLOCALPARAMETER4DARBPROC = void function(GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
alias PFNGLPROGRAMLOCALPARAMETER4DVARBPROC = void function(GLenum target, GLuint index, GLdouble *params);
alias PFNGLPROGRAMLOCALPARAMETER4FARBPROC = void function(GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
alias PFNGLPROGRAMLOCALPARAMETER4FVARBPROC = void function(GLenum target, GLuint index, GLfloat *params);
alias PFNGLGETPROGRAMENVPARAMETERDVARBPROC = void function(GLenum target, GLuint index, GLdouble *params);
alias PFNGLGETPROGRAMENVPARAMETERFVARBPROC = void function(GLenum target, GLuint index, GLfloat *params);
alias PFNGLGETPROGRAMLOCALPARAMETERDVARBPROC = void function(GLenum target, GLuint index, GLdouble *params);
alias PFNGLGETPROGRAMLOCALPARAMETERFVARBPROC = void function(GLenum target, GLuint index, GLfloat *params);
alias PFNGLGETPROGRAMIVARBPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLGETPROGRAMSTRINGARBPROC = void function(GLenum target, GLenum pname, GLvoid *string);
alias PFNGLGETVERTEXATTRIBDVARBPROC = void function(GLuint index, GLenum pname, GLdouble *params);
alias PFNGLGETVERTEXATTRIBFVARBPROC = void function(GLuint index, GLenum pname, GLfloat *params);
alias PFNGLGETVERTEXATTRIBIVARBPROC = void function(GLuint index, GLenum pname, GLint *params);
alias PFNGLGETVERTEXATTRIBPOINTERVARBPROC = void function(GLuint index, GLenum pname, GLvoid **pointer);
alias PFNGLISPROGRAMARBPROC = GLboolean function(GLuint program);

/* GL_ARB_vertex_buffer_object */
alias int GLsizeiptrARB;
alias int GLintptrARB;
alias PFNGLBINDBUFFERARBPROC = void function(GLenum target, GLuint buffer);
alias PFNGLDELETEBUFFERSARBPROC = void function(GLsizei n, GLuint *buffers);
alias PFNGLGENBUFFERSARBPROC = void function(GLsizei n, GLuint *buffers);
alias PFNGLISBUFFERARBPROC = GLboolean function(GLuint buffer);
alias PFNGLBUFFERDATAARBPROC = void function(GLenum target, GLsizeiptrARB size, void *data, GLenum usage);
alias PFNGLBUFFERSUBDATAARBPROC = void function(GLenum target, GLintptrARB offset, GLsizeiptrARB size, void *data);
alias PFNGLGETBUFFERSUBDATAARBPROC = void function(GLenum target, GLintptrARB offset, GLsizeiptrARB size, void *data);
alias PFNGLMAPBUFFERARBPROC = void * function(GLenum target, GLenum access);
alias PFNGLUNMAPBUFFERARBPROC = GLboolean function(GLenum target);
alias PFNGLGETBUFFERPARAMETERIVARBPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLGETBUFFERPOINTERVARBPROC = void function(GLenum target, GLenum pname, void **params);

/* GL_EXT_blend_color */
alias PFNGLBLENDCOLOREXTPROC = void function(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);

/* GL_EXT_polygon_offset */
alias PFNGLPOLYGONOFFSETEXTPROC = void function(GLfloat factor, GLfloat bias);

/* GL_EXT_texture3D */
alias PFNGLTEXIMAGE3DEXTPROC = void function(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, GLvoid *pixels);
alias PFNGLTEXSUBIMAGE3DEXTPROC = void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLvoid *pixels);

/* GL_SGIS_texture_filter4 */
alias PFNGLGETTEXFILTERFUNCSGISPROC = void function(GLenum target, GLenum filter, GLfloat *weights);
alias PFNGLTEXFILTERFUNCSGISPROC = void function(GLenum target, GLenum filter, GLsizei n, GLfloat *weights);

/* GL_EXT_subtexture */
alias PFNGLTEXSUBIMAGE1DEXTPROC = void function(GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, GLvoid *pixels);
alias PFNGLTEXSUBIMAGE2DEXTPROC = void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels);

/* GL_EXT_copy_texture */
alias PFNGLCOPYTEXIMAGE1DEXTPROC = void function(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border);
alias PFNGLCOPYTEXIMAGE2DEXTPROC = void function(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
alias PFNGLCOPYTEXSUBIMAGE1DEXTPROC = void function(GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
alias PFNGLCOPYTEXSUBIMAGE2DEXTPROC = void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
alias PFNGLCOPYTEXSUBIMAGE3DEXTPROC = void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);

/* GL_EXT_histogram */
alias PFNGLGETHISTOGRAMEXTPROC = void function(GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
alias PFNGLGETHISTOGRAMPARAMETERFVEXTPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLGETHISTOGRAMPARAMETERIVEXTPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLGETMINMAXEXTPROC = void function(GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
alias PFNGLGETMINMAXPARAMETERFVEXTPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLGETMINMAXPARAMETERIVEXTPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLHISTOGRAMEXTPROC = void function(GLenum target, GLsizei width, GLenum internalformat, GLboolean sink);
alias PFNGLMINMAXEXTPROC = void function(GLenum target, GLenum internalformat, GLboolean sink);
alias PFNGLRESETHISTOGRAMEXTPROC = void function(GLenum target);
alias PFNGLRESETMINMAXEXTPROC = void function(GLenum target);

/* GL_EXT_convolution */
alias PFNGLCONVOLUTIONFILTER1DEXTPROC = void function(GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, GLvoid *image);
alias PFNGLCONVOLUTIONFILTER2DEXTPROC = void function(GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *image);
alias PFNGLCONVOLUTIONPARAMETERFEXTPROC = void function(GLenum target, GLenum pname, GLfloat params);
alias PFNGLCONVOLUTIONPARAMETERFVEXTPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLCONVOLUTIONPARAMETERIEXTPROC = void function(GLenum target, GLenum pname, GLint params);
alias PFNGLCONVOLUTIONPARAMETERIVEXTPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLCOPYCONVOLUTIONFILTER1DEXTPROC = void function(GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
alias PFNGLCOPYCONVOLUTIONFILTER2DEXTPROC = void function(GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height);
alias PFNGLGETCONVOLUTIONFILTEREXTPROC = void function(GLenum target, GLenum format, GLenum type, GLvoid *image);
alias PFNGLGETCONVOLUTIONPARAMETERFVEXTPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLGETCONVOLUTIONPARAMETERIVEXTPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLGETSEPARABLEFILTEREXTPROC = void function(GLenum target, GLenum format, GLenum type, GLvoid *row, GLvoid *column, GLvoid *span);
alias PFNGLSEPARABLEFILTER2DEXTPROC = void function(GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *row, GLvoid *column);

/* GL_EXT_texture_object */
alias PFNGLARETEXTURESRESIDENTEXTPROC = GLboolean function(GLsizei n, GLuint *textures, GLboolean *residences);
alias PFNGLBINDTEXTUREEXTPROC = void function(GLenum target, GLuint texture);
alias PFNGLDELETETEXTURESEXTPROC = void function(GLsizei n, GLuint *textures);
alias PFNGLGENTEXTURESEXTPROC = void function(GLsizei n, GLuint *textures);
alias PFNGLISTEXTUREEXTPROC = GLboolean function(GLuint texture);
alias PFNGLPRIORITIZETEXTURESEXTPROC = void function(GLsizei n, GLuint *textures, GLclampf *priorities);

/* GL_EXT_vertex_array */
alias PFNGLARRAYELEMENTEXTPROC = void function(GLint i);
alias PFNGLCOLORPOINTEREXTPROC = void function(GLint size, GLenum type, GLsizei stride, GLsizei count, GLvoid *pointer);
alias PFNGLDRAWARRAYSEXTPROC = void function(GLenum mode, GLint first, GLsizei count);
alias PFNGLEDGEFLAGPOINTEREXTPROC = void function(GLsizei stride, GLsizei count, GLboolean *pointer);
alias PFNGLGETPOINTERVEXTPROC = void function(GLenum pname, GLvoid* *params);
alias PFNGLINDEXPOINTEREXTPROC = void function(GLenum type, GLsizei stride, GLsizei count, GLvoid *pointer);
alias PFNGLNORMALPOINTEREXTPROC = void function(GLenum type, GLsizei stride, GLsizei count, GLvoid *pointer);
alias PFNGLTEXCOORDPOINTEREXTPROC = void function(GLint size, GLenum type, GLsizei stride, GLsizei count, GLvoid *pointer);
alias PFNGLVERTEXPOINTEREXTPROC = void function(GLint size, GLenum type, GLsizei stride, GLsizei count, GLvoid *pointer);

/* GL_EXT_blend_minmax */
alias PFNGLBLENDEQUATIONEXTPROC = void function(GLenum mode);

/* GL_EXT_point_parameters */
alias PFNGLPOINTPARAMETERFEXTPROC = void function(GLenum pname, GLfloat param);
alias PFNGLPOINTPARAMETERFVEXTPROC = void function(GLenum pname, GLfloat *params);

/* GL_EXT_color_subtable */
alias PFNGLCOLORSUBTABLEEXTPROC = void function(GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, GLvoid *data);
alias PFNGLCOPYCOLORSUBTABLEEXTPROC = void function(GLenum target, GLsizei start, GLint x, GLint y, GLsizei width);

/* GL_EXT_paletted_texture */
alias PFNGLCOLORTABLEEXTPROC = void function(GLenum target, GLenum internalFormat, GLsizei width, GLenum format, GLenum type, GLvoid *table);
alias PFNGLGETCOLORTABLEEXTPROC = void function(GLenum target, GLenum format, GLenum type, GLvoid *data);
alias PFNGLGETCOLORTABLEPARAMETERIVEXTPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLGETCOLORTABLEPARAMETERFVEXTPROC = void function(GLenum target, GLenum pname, GLfloat *params);

/* GL_EXT_index_material */
alias PFNGLINDEXMATERIALEXTPROC = void function(GLenum face, GLenum mode);

/* GL_EXT_index_func */
alias PFNGLINDEXFUNCEXTPROC = void function(GLenum func, GLclampf reference);

/* GL_EXT_compiled_vertex_array */
alias PFNGLLOCKARRAYSEXTPROC = void function(GLint first, GLsizei count);
alias PFNGLUNLOCKARRAYSEXTPROC = void function();

/* GL_EXT_cull_vertex */
alias PFNGLCULLPARAMETERDVEXTPROC = void function(GLenum pname, GLdouble *params);
alias PFNGLCULLPARAMETERFVEXTPROC = void function(GLenum pname, GLfloat *params);

/* GL_EXT_draw_range_elements */
alias PFNGLDRAWRANGEELEMENTSEXTPROC = void function(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, GLvoid *indices);

/* GL_EXT_light_texture */
alias PFNGLAPPLYTEXTUREEXTPROC = void function(GLenum mode);
alias PFNGLTEXTURELIGHTEXTPROC = void function(GLenum pname);
alias PFNGLTEXTUREMATERIALEXTPROC = void function(GLenum face, GLenum mode);

/* GL_EXT_pixel_transform */
alias PFNGLPIXELTRANSFORMPARAMETERIEXTPROC = void function(GLenum target, GLenum pname, GLint param);
alias PFNGLPIXELTRANSFORMPARAMETERFEXTPROC = void function(GLenum target, GLenum pname, GLfloat param);
alias PFNGLPIXELTRANSFORMPARAMETERIVEXTPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLPIXELTRANSFORMPARAMETERFVEXTPROC = void function(GLenum target, GLenum pname, GLfloat *params);

/* GL_EXT_secondary_color */
alias PFNGLSECONDARYCOLOR3BEXTPROC = void function(GLbyte red, GLbyte green, GLbyte blue);
alias PFNGLSECONDARYCOLOR3BVEXTPROC = void function(GLbyte *v);
alias PFNGLSECONDARYCOLOR3DEXTPROC = void function(GLdouble red, GLdouble green, GLdouble blue);
alias PFNGLSECONDARYCOLOR3DVEXTPROC = void function(GLdouble *v);
alias PFNGLSECONDARYCOLOR3FEXTPROC = void function(GLfloat red, GLfloat green, GLfloat blue);
alias PFNGLSECONDARYCOLOR3FVEXTPROC = void function(GLfloat *v);
alias PFNGLSECONDARYCOLOR3IEXTPROC = void function(GLint red, GLint green, GLint blue);
alias PFNGLSECONDARYCOLOR3IVEXTPROC = void function(GLint *v);
alias PFNGLSECONDARYCOLOR3SEXTPROC = void function(GLshort red, GLshort green, GLshort blue);
alias PFNGLSECONDARYCOLOR3SVEXTPROC = void function(GLshort *v);
alias PFNGLSECONDARYCOLOR3UBEXTPROC = void function(GLubyte red, GLubyte green, GLubyte blue);
alias PFNGLSECONDARYCOLOR3UBVEXTPROC = void function(GLubyte *v);
alias PFNGLSECONDARYCOLOR3UIEXTPROC = void function(GLuint red, GLuint green, GLuint blue);
alias PFNGLSECONDARYCOLOR3UIVEXTPROC = void function(GLuint *v);
alias PFNGLSECONDARYCOLOR3USEXTPROC = void function(GLushort red, GLushort green, GLushort blue);
alias PFNGLSECONDARYCOLOR3USVEXTPROC = void function(GLushort *v);
alias PFNGLSECONDARYCOLORPOINTEREXTPROC = void function(GLint size, GLenum type, GLsizei stride, GLvoid *pointer);

/* GL_EXT_texture_perturb_normal */
alias PFNGLTEXTURENORMALEXTPROC = void function(GLenum mode);

/* GL_EXT_multi_draw_arrays */
alias PFNGLMULTIDRAWARRAYSEXTPROC = void function(GLenum mode, GLint *first, GLsizei *count, GLsizei primcount);
alias PFNGLMULTIDRAWELEMENTSEXTPROC = void function(GLenum mode, GLsizei *count, GLenum type, GLvoid* *indices, GLsizei primcount);

/* GL_EXT_fog_coord */
alias PFNGLFOGCOORDFEXTPROC = void function(GLfloat coord);
alias PFNGLFOGCOORDFVEXTPROC = void function(GLfloat *coord);
alias PFNGLFOGCOORDDEXTPROC = void function(GLdouble coord);
alias PFNGLFOGCOORDDVEXTPROC = void function(GLdouble *coord);
alias PFNGLFOGCOORDPOINTEREXTPROC = void function(GLenum type, GLsizei stride, GLvoid *pointer);

/* GL_EXT_coordinate_frame */
alias PFNGLTANGENT3BEXTPROC = void function(GLbyte tx, GLbyte ty, GLbyte tz);
alias PFNGLTANGENT3BVEXTPROC = void function(GLbyte *v);
alias PFNGLTANGENT3DEXTPROC = void function(GLdouble tx, GLdouble ty, GLdouble tz);
alias PFNGLTANGENT3DVEXTPROC = void function(GLdouble *v);
alias PFNGLTANGENT3FEXTPROC = void function(GLfloat tx, GLfloat ty, GLfloat tz);
alias PFNGLTANGENT3FVEXTPROC = void function(GLfloat *v);
alias PFNGLTANGENT3IEXTPROC = void function(GLint tx, GLint ty, GLint tz);
alias PFNGLTANGENT3IVEXTPROC = void function(GLint *v);
alias PFNGLTANGENT3SEXTPROC = void function(GLshort tx, GLshort ty, GLshort tz);
alias PFNGLTANGENT3SVEXTPROC = void function(GLshort *v);
alias PFNGLBINORMAL3BEXTPROC = void function(GLbyte bx, GLbyte by, GLbyte bz);
alias PFNGLBINORMAL3BVEXTPROC = void function(GLbyte *v);
alias PFNGLBINORMAL3DEXTPROC = void function(GLdouble bx, GLdouble by, GLdouble bz);
alias PFNGLBINORMAL3DVEXTPROC = void function(GLdouble *v);
alias PFNGLBINORMAL3FEXTPROC = void function(GLfloat bx, GLfloat by, GLfloat bz);
alias PFNGLBINORMAL3FVEXTPROC = void function(GLfloat *v);
alias PFNGLBINORMAL3IEXTPROC = void function(GLint bx, GLint by, GLint bz);
alias PFNGLBINORMAL3IVEXTPROC = void function(GLint *v);
alias PFNGLBINORMAL3SEXTPROC = void function(GLshort bx, GLshort by, GLshort bz);
alias PFNGLBINORMAL3SVEXTPROC = void function(GLshort *v);
alias PFNGLTANGENTPOINTEREXTPROC = void function(GLenum type, GLsizei stride, GLvoid *pointer);
alias PFNGLBINORMALPOINTEREXTPROC = void function(GLenum type, GLsizei stride, GLvoid *pointer);

/* GL_EXT_blend_func_separate */
alias PFNGLBLENDFUNCSEPARATEEXTPROC = void function(GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
alias PFNGLBLENDFUNCSEPARATEINGRPROC = void function(GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);

/* GL_EXT_vertex_weighting */
alias PFNGLVERTEXWEIGHTFEXTPROC = void function(GLfloat weight);
alias PFNGLVERTEXWEIGHTFVEXTPROC = void function(GLfloat *weight);
alias PFNGLVERTEXWEIGHTPOINTEREXTPROC = void function(GLsizei size, GLenum type, GLsizei stride, GLvoid *pointer);

/* GL_EXT_multisample */
alias PFNGLSAMPLEMASKEXTPROC = void function(GLclampf value, GLboolean invert);
alias PFNGLSAMPLEPATTERNEXTPROC = void function(GLenum pattern);

/* GL_EXT_vertex_shader */
alias PFNGLBEGINVERTEXSHADEREXTPROC = void function();
alias PFNGLENDVERTEXSHADEREXTPROC = void function();
alias PFNGLBINDVERTEXSHADEREXTPROC = void function(GLuint id);
alias PFNGLGENVERTEXSHADERSEXTPROC = GLuint function(GLuint range);
alias PFNGLDELETEVERTEXSHADEREXTPROC = void function(GLuint id);
alias PFNGLSHADEROP1EXTPROC = void function(GLenum op, GLuint res, GLuint arg1);
alias PFNGLSHADEROP2EXTPROC = void function(GLenum op, GLuint res, GLuint arg1, GLuint arg2);
alias PFNGLSHADEROP3EXTPROC = void function(GLenum op, GLuint res, GLuint arg1, GLuint arg2, GLuint arg3);
alias PFNGLSWIZZLEEXTPROC = void function(GLuint res, GLuint in_, GLenum outX, GLenum outY, GLenum outZ, GLenum outW);
alias PFNGLWRITEMASKEXTPROC = void function(GLuint res, GLuint in_, GLenum outX, GLenum outY, GLenum outZ, GLenum outW);
alias PFNGLINSERTCOMPONENTEXTPROC = void function(GLuint res, GLuint src, GLuint num);
alias PFNGLEXTRACTCOMPONENTEXTPROC = void function(GLuint res, GLuint src, GLuint num);
alias PFNGLGENSYMBOLSEXTPROC = GLuint function(GLenum datatype, GLenum storagetype, GLenum range, GLuint components);
alias PFNGLSETINVARIANTEXTPROC = void function(GLuint id, GLenum type, void *addr);
alias PFNGLSETLOCALCONSTANTEXTPROC = void function(GLuint id, GLenum type, void *addr);
alias PFNGLVARIANTBVEXTPROC = void function(GLuint id, GLbyte *addr);
alias PFNGLVARIANTSVEXTPROC = void function(GLuint id, GLshort *addr);
alias PFNGLVARIANTIVEXTPROC = void function(GLuint id, GLint *addr);
alias PFNGLVARIANTFVEXTPROC = void function(GLuint id, GLfloat *addr);
alias PFNGLVARIANTDVEXTPROC = void function(GLuint id, GLdouble *addr);
alias PFNGLVARIANTUBVEXTPROC = void function(GLuint id, GLubyte *addr);
alias PFNGLVARIANTUSVEXTPROC = void function(GLuint id, GLushort *addr);
alias PFNGLVARIANTUIVEXTPROC = void function(GLuint id, GLuint *addr);
alias PFNGLVARIANTPOINTEREXTPROC = void function(GLuint id, GLenum type, GLuint stride, void *addr);
alias PFNGLENABLEVARIANTCLIENTSTATEEXTPROC = void function(GLuint id);
alias PFNGLDISABLEVARIANTCLIENTSTATEEXTPROC = void function(GLuint id);
alias PFNGLBINDLIGHTPARAMETEREXTPROC = GLuint function(GLenum light, GLenum value);
alias PFNGLBINDMATERIALPARAMETEREXTPROC = GLuint function(GLenum face, GLenum value);
alias PFNGLBINDTEXGENPARAMETEREXTPROC = GLuint function(GLenum unit, GLenum coord, GLenum value);
alias PFNGLBINDTEXTUREUNITPARAMETEREXTPROC = GLuint function(GLenum unit, GLenum value);
alias PFNGLBINDPARAMETEREXTPROC = GLuint function(GLenum value);
alias PFNGLISVARIANTENABLEDEXTPROC = GLboolean function(GLuint id, GLenum cap);
alias PFNGLGETVARIANTBOOLEANVEXTPROC = void function(GLuint id, GLenum value, GLboolean *data);
alias PFNGLGETVARIANTINTEGERVEXTPROC = void function(GLuint id, GLenum value, GLint *data);
alias PFNGLGETVARIANTFLOATVEXTPROC = void function(GLuint id, GLenum value, GLfloat *data);
alias PFNGLGETVARIANTPOINTERVEXTPROC = void function(GLuint id, GLenum value, GLvoid* *data);
alias PFNGLGETINVARIANTBOOLEANVEXTPROC = void function(GLuint id, GLenum value, GLboolean *data);
alias PFNGLGETINVARIANTINTEGERVEXTPROC = void function(GLuint id, GLenum value, GLint *data);
alias PFNGLGETINVARIANTFLOATVEXTPROC = void function(GLuint id, GLenum value, GLfloat *data);
alias PFNGLGETLOCALCONSTANTBOOLEANVEXTPROC = void function(GLuint id, GLenum value, GLboolean *data);
alias PFNGLGETLOCALCONSTANTINTEGERVEXTPROC = void function(GLuint id, GLenum value, GLint *data);
alias PFNGLGETLOCALCONSTANTFLOATVEXTPROC = void function(GLuint id, GLenum value, GLfloat *data);

/* GL_EXT_stencil_two_side */
alias PFNGLACTIVESTENCILFACEEXTPROC = void function(GLenum face);

/* GL_SGI_color_table */
alias PFNGLCOLORTABLESGIPROC = void function(GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, GLvoid *table);
alias PFNGLCOLORTABLEPARAMETERFVSGIPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLCOLORTABLEPARAMETERIVSGIPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLCOPYCOLORTABLESGIPROC = void function(GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
alias PFNGLGETCOLORTABLESGIPROC = void function(GLenum target, GLenum format, GLenum type, GLvoid *table);
alias PFNGLGETCOLORTABLEPARAMETERFVSGIPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLGETCOLORTABLEPARAMETERIVSGIPROC = void function(GLenum target, GLenum pname, GLint *params);

/* GL_SGIX_pixel_texture */
alias PFNGLPIXELTEXGENSGIXPROC = void function(GLenum mode);

/* GL_SGIS_pixel_texture */
alias PFNGLPIXELTEXGENPARAMETERISGISPROC = void function(GLenum pname, GLint param);
alias PFNGLPIXELTEXGENPARAMETERIVSGISPROC = void function(GLenum pname, GLint *params);
alias PFNGLPIXELTEXGENPARAMETERFSGISPROC = void function(GLenum pname, GLfloat param);
alias PFNGLPIXELTEXGENPARAMETERFVSGISPROC = void function(GLenum pname, GLfloat *params);
alias PFNGLGETPIXELTEXGENPARAMETERIVSGISPROC = void function(GLenum pname, GLint *params);
alias PFNGLGETPIXELTEXGENPARAMETERFVSGISPROC = void function(GLenum pname, GLfloat *params);

/* GL_SGIS_texture4D */
alias PFNGLTEXIMAGE4DSGISPROC = void function(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLsizei size4d, GLint border, GLenum format, GLenum type, GLvoid *pixels);
alias PFNGLTEXSUBIMAGE4DSGISPROC = void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint woffset, GLsizei width, GLsizei height, GLsizei depth, GLsizei size4d, GLenum format, GLenum type, GLvoid *pixels);

/* GL_SGIS_detail_texture */
alias PFNGLDETAILTEXFUNCSGISPROC = void function(GLenum target, GLsizei n, GLfloat *points);
alias PFNGLGETDETAILTEXFUNCSGISPROC = void function(GLenum target, GLfloat *points);

/* GL_SGIS_sharpen_texture */
alias PFNGLSHARPENTEXFUNCSGISPROC = void function(GLenum target, GLsizei n, GLfloat *points);
alias PFNGLGETSHARPENTEXFUNCSGISPROC = void function(GLenum target, GLfloat *points);

/* GL_SGIS_multisample */
alias PFNGLSAMPLEMASKSGISPROC = void function(GLclampf value, GLboolean invert);
alias PFNGLSAMPLEPATTERNSGISPROC = void function(GLenum pattern);

/* GL_SGIX_sprite */
alias PFNGLSPRITEPARAMETERFSGIXPROC = void function(GLenum pname, GLfloat param);
alias PFNGLSPRITEPARAMETERFVSGIXPROC = void function(GLenum pname, GLfloat *params);
alias PFNGLSPRITEPARAMETERISGIXPROC = void function(GLenum pname, GLint param);
alias PFNGLSPRITEPARAMETERIVSGIXPROC = void function(GLenum pname, GLint *params);

/* GL_SGIS_point_parameters */
alias PFNGLPOINTPARAMETERFSGISPROC = void function(GLenum pname, GLfloat param);
alias PFNGLPOINTPARAMETERFVSGISPROC = void function(GLenum pname, GLfloat *params);

/* GL_SGIX_instruments */
alias PFNGLGETINSTRUMENTSSGIXPROC = GLint function();
alias PFNGLINSTRUMENTSBUFFERSGIXPROC = void function(GLsizei size, GLint *buffer);
alias PFNGLPOLLINSTRUMENTSSGIXPROC = GLint function(GLint *marker_p);
alias PFNGLREADINSTRUMENTSSGIXPROC = void function(GLint marker);
alias PFNGLSTARTINSTRUMENTSSGIXPROC = void function();
alias PFNGLSTOPINSTRUMENTSSGIXPROC = void function(GLint marker);

/* GL_SGIX_framezoom */
alias PFNGLFRAMEZOOMSGIXPROC = void function(GLint factor);

/* GL_SGIX_tag_sample_buffer */
alias PFNGLTAGSAMPLEBUFFERSGIXPROC = void function();

/* GL_SGIX_polynomial_ffd */
alias PFNGLDEFORMATIONMAP3DSGIXPROC = void function(GLenum target, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, GLdouble w1, GLdouble w2, GLint wstride, GLint worder, GLdouble *points);
alias PFNGLDEFORMATIONMAP3FSGIXPROC = void function(GLenum target, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, GLfloat w1, GLfloat w2, GLint wstride, GLint worder, GLfloat *points);
alias PFNGLDEFORMSGIXPROC = void function(GLbitfield mask);
alias PFNGLLOADIDENTITYDEFORMATIONMAPSGIXPROC = void function(GLbitfield mask);

/* GL_SGIX_reference_plane */
alias PFNGLREFERENCEPLANESGIXPROC = void function(GLdouble *equation);

/* GL_SGIX_flush_raster */
alias PFNGLFLUSHRASTERSGIXPROC = void function();

/* GL_SGIS_fog_function */
alias PFNGLFOGFUNCSGISPROC = void function(GLsizei n, GLfloat *points);
alias PFNGLGETFOGFUNCSGISPROC = void function(GLfloat *points);

/* GL_HP_image_transform */
alias PFNGLIMAGETRANSFORMPARAMETERIHPPROC = void function(GLenum target, GLenum pname, GLint param);
alias PFNGLIMAGETRANSFORMPARAMETERFHPPROC = void function(GLenum target, GLenum pname, GLfloat param);
alias PFNGLIMAGETRANSFORMPARAMETERIVHPPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLIMAGETRANSFORMPARAMETERFVHPPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLGETIMAGETRANSFORMPARAMETERIVHPPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLGETIMAGETRANSFORMPARAMETERFVHPPROC = void function(GLenum target, GLenum pname, GLfloat *params);

/* GL_PGI_misc_hints */
alias PFNGLHINTPGIPROC = void function(GLenum target, GLint mode);

/* GL_SGIX_list_priority */
alias PFNGLGETLISTPARAMETERFVSGIXPROC = void function(GLuint list, GLenum pname, GLfloat *params);
alias PFNGLGETLISTPARAMETERIVSGIXPROC = void function(GLuint list, GLenum pname, GLint *params);
alias PFNGLLISTPARAMETERFSGIXPROC = void function(GLuint list, GLenum pname, GLfloat param);
alias PFNGLLISTPARAMETERFVSGIXPROC = void function(GLuint list, GLenum pname, GLfloat *params);
alias PFNGLLISTPARAMETERISGIXPROC = void function(GLuint list, GLenum pname, GLint param);
alias PFNGLLISTPARAMETERIVSGIXPROC = void function(GLuint list, GLenum pname, GLint *params);

/* GL_SGIX_fragment_lighting */
alias PFNGLFRAGMENTCOLORMATERIALSGIXPROC = void function(GLenum face, GLenum mode);
alias PFNGLFRAGMENTLIGHTFSGIXPROC = void function(GLenum light, GLenum pname, GLfloat param);
alias PFNGLFRAGMENTLIGHTFVSGIXPROC = void function(GLenum light, GLenum pname, GLfloat *params);
alias PFNGLFRAGMENTLIGHTISGIXPROC = void function(GLenum light, GLenum pname, GLint param);
alias PFNGLFRAGMENTLIGHTIVSGIXPROC = void function(GLenum light, GLenum pname, GLint *params);
alias PFNGLFRAGMENTLIGHTMODELFSGIXPROC = void function(GLenum pname, GLfloat param);
alias PFNGLFRAGMENTLIGHTMODELFVSGIXPROC = void function(GLenum pname, GLfloat *params);
alias PFNGLFRAGMENTLIGHTMODELISGIXPROC = void function(GLenum pname, GLint param);
alias PFNGLFRAGMENTLIGHTMODELIVSGIXPROC = void function(GLenum pname, GLint *params);
alias PFNGLFRAGMENTMATERIALFSGIXPROC = void function(GLenum face, GLenum pname, GLfloat param);
alias PFNGLFRAGMENTMATERIALFVSGIXPROC = void function(GLenum face, GLenum pname, GLfloat *params);
alias PFNGLFRAGMENTMATERIALISGIXPROC = void function(GLenum face, GLenum pname, GLint param);
alias PFNGLFRAGMENTMATERIALIVSGIXPROC = void function(GLenum face, GLenum pname, GLint *params);
alias PFNGLGETFRAGMENTLIGHTFVSGIXPROC = void function(GLenum light, GLenum pname, GLfloat *params);
alias PFNGLGETFRAGMENTLIGHTIVSGIXPROC = void function(GLenum light, GLenum pname, GLint *params);
alias PFNGLGETFRAGMENTMATERIALFVSGIXPROC = void function(GLenum face, GLenum pname, GLfloat *params);
alias PFNGLGETFRAGMENTMATERIALIVSGIXPROC = void function(GLenum face, GLenum pname, GLint *params);
alias PFNGLLIGHTENVISGIXPROC = void function(GLenum pname, GLint param);

/* GL_SGIX_async */
alias PFNGLASYNCMARKERSGIXPROC = void function(GLuint marker);
alias PFNGLFINISHASYNCSGIXPROC = GLint function(GLuint *markerp);
alias PFNGLPOLLASYNCSGIXPROC = GLint function(GLuint *markerp);
alias PFNGLGENASYNCMARKERSSGIXPROC = GLuint function(GLsizei range);
alias PFNGLDELETEASYNCMARKERSSGIXPROC = void function(GLuint marker, GLsizei range);
alias PFNGLISASYNCMARKERSGIXPROC = GLboolean function(GLuint marker);

/* GL_INTEL_parallel_arrays */
alias PFNGLVERTEXPOINTERVINTELPROC = void function(GLint size, GLenum type, GLvoid* *pointer);
alias PFNGLNORMALPOINTERVINTELPROC = void function(GLenum type, GLvoid* *pointer);
alias PFNGLCOLORPOINTERVINTELPROC = void function(GLint size, GLenum type, GLvoid* *pointer);
alias PFNGLTEXCOORDPOINTERVINTELPROC = void function(GLint size, GLenum type, GLvoid* *pointer);

/* GL_SUNX_constant_data */
alias PFNGLFINISHTEXTURESUNXPROC = void function();

/* GL_SUN_global_alpha */
alias PFNGLGLOBALALPHAFACTORBSUNPROC = void function(GLbyte factor);
alias PFNGLGLOBALALPHAFACTORSSUNPROC = void function(GLshort factor);
alias PFNGLGLOBALALPHAFACTORISUNPROC = void function(GLint factor);
alias PFNGLGLOBALALPHAFACTORFSUNPROC = void function(GLfloat factor);
alias PFNGLGLOBALALPHAFACTORDSUNPROC = void function(GLdouble factor);
alias PFNGLGLOBALALPHAFACTORUBSUNPROC = void function(GLubyte factor);
alias PFNGLGLOBALALPHAFACTORUSSUNPROC = void function(GLushort factor);
alias PFNGLGLOBALALPHAFACTORUISUNPROC = void function(GLuint factor);

/* GL_SUN_triangle_list */
alias PFNGLREPLACEMENTCODEUISUNPROC = void function(GLuint code);
alias PFNGLREPLACEMENTCODEUSSUNPROC = void function(GLushort code);
alias PFNGLREPLACEMENTCODEUBSUNPROC = void function(GLubyte code);
alias PFNGLREPLACEMENTCODEUIVSUNPROC = void function(GLuint *code);
alias PFNGLREPLACEMENTCODEUSVSUNPROC = void function(GLushort *code);
alias PFNGLREPLACEMENTCODEUBVSUNPROC = void function(GLubyte *code);
alias PFNGLREPLACEMENTCODEPOINTERSUNPROC = void function(GLenum type, GLsizei stride, GLvoid* *pointer);

/* GL_SUN_vertex */
alias PFNGLCOLOR4UBVERTEX2FSUNPROC = void function(GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y);
alias PFNGLCOLOR4UBVERTEX2FVSUNPROC = void function(GLubyte *c, GLfloat *v);
alias PFNGLCOLOR4UBVERTEX3FSUNPROC = void function(GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLCOLOR4UBVERTEX3FVSUNPROC = void function(GLubyte *c, GLfloat *v);
alias PFNGLCOLOR3FVERTEX3FSUNPROC = void function(GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLCOLOR3FVERTEX3FVSUNPROC = void function(GLfloat *c, GLfloat *v);
alias PFNGLNORMAL3FVERTEX3FSUNPROC = void function(GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLNORMAL3FVERTEX3FVSUNPROC = void function(GLfloat *n, GLfloat *v);
alias PFNGLCOLOR4FNORMAL3FVERTEX3FSUNPROC = void function(GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLCOLOR4FNORMAL3FVERTEX3FVSUNPROC = void function(GLfloat *c, GLfloat *n, GLfloat *v);
alias PFNGLTEXCOORD2FVERTEX3FSUNPROC = void function(GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLTEXCOORD2FVERTEX3FVSUNPROC = void function(GLfloat *tc, GLfloat *v);
alias PFNGLTEXCOORD4FVERTEX4FSUNPROC = void function(GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
alias PFNGLTEXCOORD4FVERTEX4FVSUNPROC = void function(GLfloat *tc, GLfloat *v);
alias PFNGLTEXCOORD2FCOLOR4UBVERTEX3FSUNPROC = void function(GLfloat s, GLfloat t, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLTEXCOORD2FCOLOR4UBVERTEX3FVSUNPROC = void function(GLfloat *tc, GLubyte *c, GLfloat *v);
alias PFNGLTEXCOORD2FCOLOR3FVERTEX3FSUNPROC = void function(GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLTEXCOORD2FCOLOR3FVERTEX3FVSUNPROC = void function(GLfloat *tc, GLfloat *c, GLfloat *v);
alias PFNGLTEXCOORD2FNORMAL3FVERTEX3FSUNPROC = void function(GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLTEXCOORD2FNORMAL3FVERTEX3FVSUNPROC = void function(GLfloat *tc, GLfloat *n, GLfloat *v);
alias PFNGLTEXCOORD2FCOLOR4FNORMAL3FVERTEX3FSUNPROC = void function(GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLTEXCOORD2FCOLOR4FNORMAL3FVERTEX3FVSUNPROC = void function(GLfloat *tc, GLfloat *c, GLfloat *n, GLfloat *v);
alias PFNGLTEXCOORD4FCOLOR4FNORMAL3FVERTEX4FSUNPROC = void function(GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
alias PFNGLTEXCOORD4FCOLOR4FNORMAL3FVERTEX4FVSUNPROC = void function(GLfloat *tc, GLfloat *c, GLfloat *n, GLfloat *v);
alias PFNGLREPLACEMENTCODEUIVERTEX3FSUNPROC = void function(GLuint rc, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLREPLACEMENTCODEUIVERTEX3FVSUNPROC = void function(GLuint *rc, GLfloat *v);
alias PFNGLREPLACEMENTCODEUICOLOR4UBVERTEX3FSUNPROC = void function(GLuint rc, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLREPLACEMENTCODEUICOLOR4UBVERTEX3FVSUNPROC = void function(GLuint *rc, GLubyte *c, GLfloat *v);
alias PFNGLREPLACEMENTCODEUICOLOR3FVERTEX3FSUNPROC = void function(GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLREPLACEMENTCODEUICOLOR3FVERTEX3FVSUNPROC = void function(GLuint *rc, GLfloat *c, GLfloat *v);
alias PFNGLREPLACEMENTCODEUINORMAL3FVERTEX3FSUNPROC = void function(GLuint rc, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLREPLACEMENTCODEUINORMAL3FVERTEX3FVSUNPROC = void function(GLuint *rc, GLfloat *n, GLfloat *v);
alias PFNGLREPLACEMENTCODEUICOLOR4FNORMAL3FVERTEX3FSUNPROC = void function(GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLREPLACEMENTCODEUICOLOR4FNORMAL3FVERTEX3FVSUNPROC = void function(GLuint *rc, GLfloat *c, GLfloat *n, GLfloat *v);
alias PFNGLREPLACEMENTCODEUITEXCOORD2FVERTEX3FSUNPROC = void function(GLuint rc, GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLREPLACEMENTCODEUITEXCOORD2FVERTEX3FVSUNPROC = void function(GLuint *rc, GLfloat *tc, GLfloat *v);
alias PFNGLREPLACEMENTCODEUITEXCOORD2FNORMAL3FVERTEX3FSUNPROC = void function(GLuint rc, GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLREPLACEMENTCODEUITEXCOORD2FNORMAL3FVERTEX3FVSUNPROC = void function(GLuint *rc, GLfloat *tc, GLfloat *n, GLfloat *v);
alias PFNGLREPLACEMENTCODEUITEXCOORD2FCOLOR4FNORMAL3FVERTEX3FSUNPROC = void function(GLuint rc, GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLREPLACEMENTCODEUITEXCOORD2FCOLOR4FNORMAL3FVERTEX3FVSUNPROC = void function(GLuint *rc, GLfloat *tc, GLfloat *c, GLfloat *n, GLfloat *v);

/* GL_NV_vertex_array_range */
alias PFNGLFLUSHVERTEXARRAYRANGENVPROC = void function();
alias PFNGLVERTEXARRAYRANGENVPROC = void function(GLsizei length, GLvoid *pointer);

/* GL_NV_primitive_restart */
alias PFNGLPRIMITIVERESTARTNVPROC = void function();
alias PFNGLPRIMITIVERESTARTINDEXNVPROC = void function(GLuint index);

/* GL_NV_register_combiners */
alias PFNGLCOMBINERPARAMETERFVNVPROC = void function(GLenum pname, GLfloat *params);
alias PFNGLCOMBINERPARAMETERFNVPROC = void function(GLenum pname, GLfloat param);
alias PFNGLCOMBINERPARAMETERIVNVPROC = void function(GLenum pname, GLint *params);
alias PFNGLCOMBINERPARAMETERINVPROC = void function(GLenum pname, GLint param);
alias PFNGLCOMBINERINPUTNVPROC = void function(GLenum stage, GLenum portion, GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage);
alias PFNGLCOMBINEROUTPUTNVPROC = void function(GLenum stage, GLenum portion, GLenum abOutput, GLenum cdOutput, GLenum sumOutput, GLenum scale, GLenum bias, GLboolean abDotProduct, GLboolean cdDotProduct, GLboolean muxSum);
alias PFNGLFINALCOMBINERINPUTNVPROC = void function(GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage);
alias PFNGLGETCOMBINERINPUTPARAMETERFVNVPROC = void function(GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLfloat *params);
alias PFNGLGETCOMBINERINPUTPARAMETERIVNVPROC = void function(GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLint *params);
alias PFNGLGETCOMBINEROUTPUTPARAMETERFVNVPROC = void function(GLenum stage, GLenum portion, GLenum pname, GLfloat *params);
alias PFNGLGETCOMBINEROUTPUTPARAMETERIVNVPROC = void function(GLenum stage, GLenum portion, GLenum pname, GLint *params);
alias PFNGLGETFINALCOMBINERINPUTPARAMETERFVNVPROC = void function(GLenum variable, GLenum pname, GLfloat *params);
alias PFNGLGETFINALCOMBINERINPUTPARAMETERIVNVPROC = void function(GLenum variable, GLenum pname, GLint *params);

/* GL_NV_fragment_program */
alias PFNGLPROGRAMNAMEDPARAMETER4FNVPROC = void function(GLuint id, GLsizei len, GLubyte *name, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
alias PFNGLPROGRAMNAMEDPARAMETER4DNVPROC = void function(GLuint id, GLsizei len, GLubyte *name, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
alias PFNGLPROGRAMNAMEDPARAMETER4FVNVPROC = void function(GLuint id, GLsizei len, GLubyte *name, GLfloat v[]);
alias PFNGLPROGRAMNAMEDPARAMETER4DVNVPROC = void function(GLuint id, GLsizei len, GLubyte *name, GLdouble v[]);
alias PFNGLGETPROGRAMNAMEDPARAMETERFVNVPROC = void function(GLuint id, GLsizei len, GLubyte *name, GLfloat *params);
alias PFNGLGETPROGRAMNAMEDPARAMETERDVNVPROC = void function(GLuint id, GLsizei len, GLubyte *name, GLdouble *params);

/* GL_NV_half_float */
alias ushort GLhalf;
alias PFNGLVERTEX2HNVPROC = void function(GLhalf x, GLhalf y);
alias PFNGLVERTEX2HVNVPROC = void function(GLhalf *v);
alias PFNGLVERTEX3HNVPROC = void function(GLhalf x, GLhalf y, GLhalf z);
alias PFNGLVERTEX3HVNVPROC = void function(GLhalf *v);
alias PFNGLVERTEX4HNVPROC = void function(GLhalf x, GLhalf y, GLhalf z, GLhalf w);
alias PFNGLVERTEX4HVNVPROC = void function(GLhalf *v);
alias PFNGLNORMAL3HNVPROC = void function(GLhalf nx, GLhalf ny, GLhalf nz);
alias PFNGLNORMAL3HVNVPROC = void function(GLhalf *v);
alias PFNGLCOLOR3HNVPROC = void function(GLhalf red, GLhalf green, GLhalf blue);
alias PFNGLCOLOR3HVNVPROC = void function(GLhalf *v);
alias PFNGLCOLOR4HNVPROC = void function(GLhalf red, GLhalf green, GLhalf blue, GLhalf alpha);
alias PFNGLCOLOR4HVNVPROC = void function(GLhalf *v);
alias PFNGLTEXCOORD1HNVPROC = void function(GLhalf s);
alias PFNGLTEXCOORD1HVNVPROC = void function(GLhalf *v);
alias PFNGLTEXCOORD2HNVPROC = void function(GLhalf s, GLhalf t);
alias PFNGLTEXCOORD2HVNVPROC = void function(GLhalf *v);
alias PFNGLTEXCOORD3HNVPROC = void function(GLhalf s, GLhalf t, GLhalf r);
alias PFNGLTEXCOORD3HVNVPROC = void function(GLhalf *v);
alias PFNGLTEXCOORD4HNVPROC = void function(GLhalf s, GLhalf t, GLhalf r, GLhalf q);
alias PFNGLTEXCOORD4HVNVPROC = void function(GLhalf *v);
alias PFNGLMULTITEXCOORD1HNVPROC = void function(GLenum target, GLhalf s);
alias PFNGLMULTITEXCOORD1HVNVPROC = void function(GLenum target, GLhalf *v);
alias PFNGLMULTITEXCOORD2HNVPROC = void function(GLenum target, GLhalf s, GLhalf t);
alias PFNGLMULTITEXCOORD2HVNVPROC = void function(GLenum target, GLhalf *v);
alias PFNGLMULTITEXCOORD3HNVPROC = void function(GLenum target, GLhalf s, GLhalf t, GLhalf r);
alias PFNGLMULTITEXCOORD3HVNVPROC = void function(GLenum target, GLhalf *v);
alias PFNGLMULTITEXCOORD4HNVPROC = void function(GLenum target, GLhalf s, GLhalf t, GLhalf r, GLhalf q);
alias PFNGLMULTITEXCOORD4HVNVPROC = void function(GLenum target, GLhalf *v);
alias PFNGLFOGCOORDHNVPROC = void function(GLhalf fog);
alias PFNGLFOGCOORDHVNVPROC = void function(GLhalf *fog);
alias PFNGLSECONDARYCOLOR3HNVPROC = void function(GLhalf red, GLhalf green, GLhalf blue);
alias PFNGLSECONDARYCOLOR3HVNVPROC = void function(GLhalf *v);
alias PFNGLVERTEXWEIGHTHNVPROC = void function(GLhalf weight);
alias PFNGLVERTEXWEIGHTHVNVPROC = void function(GLhalf *weight);
alias PFNGLVERTEXATTRIB1HNVPROC = void function(GLuint index, GLhalf x);
alias PFNGLVERTEXATTRIB1HVNVPROC = void function(GLuint index, GLhalf *v);
alias PFNGLVERTEXATTRIB2HNVPROC = void function(GLuint index, GLhalf x, GLhalf y);
alias PFNGLVERTEXATTRIB2HVNVPROC = void function(GLuint index, GLhalf *v);
alias PFNGLVERTEXATTRIB3HNVPROC = void function(GLuint index, GLhalf x, GLhalf y, GLhalf z);
alias PFNGLVERTEXATTRIB3HVNVPROC = void function(GLuint index, GLhalf *v);
alias PFNGLVERTEXATTRIB4HNVPROC = void function(GLuint index, GLhalf x, GLhalf y, GLhalf z, GLhalf w);
alias PFNGLVERTEXATTRIB4HVNVPROC = void function(GLuint index, GLhalf *v);
alias PFNGLVERTEXATTRIBS1HVNVPROC = void function(GLuint index, GLsizei n, GLhalf *v);
alias PFNGLVERTEXATTRIBS2HVNVPROC = void function(GLuint index, GLsizei n, GLhalf *v);
alias PFNGLVERTEXATTRIBS3HVNVPROC = void function(GLuint index, GLsizei n, GLhalf *v);
alias PFNGLVERTEXATTRIBS4HVNVPROC = void function(GLuint index, GLsizei n, GLhalf *v);

/* GL_NV_stencil_two_side */
alias PFNGLACTIVESTENCILFACENVPROC = void function(GLenum face);

/* GL_MESA_resize_buffers */
alias PFNGLRESIZEBUFFERSMESAPROC = void function();

/* GL_MESA_window_pos */
alias PFNGLWINDOWPOS2DMESAPROC = void function(GLdouble x, GLdouble y);
alias PFNGLWINDOWPOS2DVMESAPROC = void function(GLdouble *v);
alias PFNGLWINDOWPOS2FMESAPROC = void function(GLfloat x, GLfloat y);
alias PFNGLWINDOWPOS2FVMESAPROC = void function(GLfloat *v);
alias PFNGLWINDOWPOS2IMESAPROC = void function(GLint x, GLint y);
alias PFNGLWINDOWPOS2IVMESAPROC = void function(GLint *v);
alias PFNGLWINDOWPOS2SMESAPROC = void function(GLshort x, GLshort y);
alias PFNGLWINDOWPOS2SVMESAPROC = void function(GLshort *v);
alias PFNGLWINDOWPOS3DMESAPROC = void function(GLdouble x, GLdouble y, GLdouble z);
alias PFNGLWINDOWPOS3DVMESAPROC = void function(GLdouble *v);
alias PFNGLWINDOWPOS3FMESAPROC = void function(GLfloat x, GLfloat y, GLfloat z);
alias PFNGLWINDOWPOS3FVMESAPROC = void function(GLfloat *v);
alias PFNGLWINDOWPOS3IMESAPROC = void function(GLint x, GLint y, GLint z);
alias PFNGLWINDOWPOS3IVMESAPROC = void function(GLint *v);
alias PFNGLWINDOWPOS3SMESAPROC = void function(GLshort x, GLshort y, GLshort z);
alias PFNGLWINDOWPOS3SVMESAPROC = void function(GLshort *v);
alias PFNGLWINDOWPOS4DMESAPROC = void function(GLdouble x, GLdouble y, GLdouble z, GLdouble w);
alias PFNGLWINDOWPOS4DVMESAPROC = void function(GLdouble *v);
alias PFNGLWINDOWPOS4FMESAPROC = void function(GLfloat x, GLfloat y, GLfloat z, GLfloat w);
alias PFNGLWINDOWPOS4FVMESAPROC = void function(GLfloat *v);
alias PFNGLWINDOWPOS4IMESAPROC = void function(GLint x, GLint y, GLint z, GLint w);
alias PFNGLWINDOWPOS4IVMESAPROC = void function(GLint *v);
alias PFNGLWINDOWPOS4SMESAPROC = void function(GLshort x, GLshort y, GLshort z, GLshort w);
alias PFNGLWINDOWPOS4SVMESAPROC = void function(GLshort *v);

/* GL_IBM_multimode_draw_arrays */
alias PFNGLMULTIMODEDRAWARRAYSIBMPROC = void function(GLenum mode, GLint *first, GLsizei *count, GLsizei primcount, GLint modestride);
alias PFNGLMULTIMODEDRAWELEMENTSIBMPROC = void function(GLenum *mode, GLsizei *count, GLenum type, GLvoid* *indices, GLsizei primcount, GLint modestride);

/* GL_IBM_vertex_array_lists */
alias PFNGLCOLORPOINTERLISTIBMPROC = void function(GLint size, GLenum type, GLint stride, GLvoid* *pointer, GLint ptrstride);
alias PFNGLSECONDARYCOLORPOINTERLISTIBMPROC = void function(GLint size, GLenum type, GLint stride, GLvoid* *pointer, GLint ptrstride);
alias PFNGLEDGEFLAGPOINTERLISTIBMPROC = void function(GLint stride, GLboolean* *pointer, GLint ptrstride);
alias PFNGLFOGCOORDPOINTERLISTIBMPROC = void function(GLenum type, GLint stride, GLvoid* *pointer, GLint ptrstride);
alias PFNGLINDEXPOINTERLISTIBMPROC = void function(GLenum type, GLint stride, GLvoid* *pointer, GLint ptrstride);
alias PFNGLNORMALPOINTERLISTIBMPROC = void function(GLenum type, GLint stride, GLvoid* *pointer, GLint ptrstride);
alias PFNGLTEXCOORDPOINTERLISTIBMPROC = void function(GLint size, GLenum type, GLint stride, GLvoid* *pointer, GLint ptrstride);
alias PFNGLVERTEXPOINTERLISTIBMPROC = void function(GLint size, GLenum type, GLint stride, GLvoid* *pointer, GLint ptrstride);

/* GL_3DFX_tbuffer */
alias PFNGLTBUFFERMASK3DFXPROC = void function(GLuint mask);

/* GL_SGIS_texture_color_mask */
alias PFNGLTEXTURECOLORMASKSGISPROC = void function(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);

/* GL_SGIX_igloo_interface */
alias PFNGLIGLOOINTERFACESGIXPROC = void function(GLenum pname, GLvoid *params);

/* GL_NV_fence */
alias PFNGLDELETEFENCESNVPROC = void function(GLsizei n, GLuint *fences);
alias PFNGLGENFENCESNVPROC = void function(GLsizei n, GLuint *fences);
alias PFNGLISFENCENVPROC = GLboolean function(GLuint fence);
alias PFNGLTESTFENCENVPROC = GLboolean function(GLuint fence);
alias PFNGLGETFENCEIVNVPROC = void function(GLuint fence, GLenum pname, GLint *params);
alias PFNGLFINISHFENCENVPROC = void function(GLuint fence);
alias PFNGLSETFENCENVPROC = void function(GLuint fence, GLenum condition);

/* GL_NV_element_array */
alias PFNGLELEMENTPOINTERNVPROC = void function(GLenum type, GLvoid *pointer);
alias PFNGLDRAWELEMENTARRAYNVPROC = void function(GLenum mode, GLint first, GLsizei count);
alias PFNGLDRAWRANGEELEMENTARRAYNVPROC = void function(GLenum mode, GLuint start, GLuint end, GLint first, GLsizei count);
alias PFNGLMULTIDRAWELEMENTARRAYNVPROC = void function(GLenum mode, GLint *first, GLsizei *count, GLsizei primcount);
alias PFNGLMULTIDRAWRANGEELEMENTARRAYNVPROC = void function(GLenum mode, GLuint start, GLuint end, GLint *first, GLsizei *count, GLsizei primcount);

/* GL_NV_evaluators */
alias PFNGLMAPCONTROLPOINTSNVPROC = void function(GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLint uorder, GLint vorder, GLboolean packed, GLvoid *points);
alias PFNGLMAPPARAMETERIVNVPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLMAPPARAMETERFVNVPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLGETMAPCONTROLPOINTSNVPROC = void function(GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLboolean packed, GLvoid *points);
alias PFNGLGETMAPPARAMETERIVNVPROC = void function(GLenum target, GLenum pname, GLint *params);
alias PFNGLGETMAPPARAMETERFVNVPROC = void function(GLenum target, GLenum pname, GLfloat *params);
alias PFNGLGETMAPATTRIBPARAMETERIVNVPROC = void function(GLenum target, GLuint index, GLenum pname, GLint *params);
alias PFNGLGETMAPATTRIBPARAMETERFVNVPROC = void function(GLenum target, GLuint index, GLenum pname, GLfloat *params);
alias PFNGLEVALMAPSNVPROC = void function(GLenum target, GLenum mode);

/* GL_NV_register_combiners2 */
alias PFNGLCOMBINERSTAGEPARAMETERFVNVPROC = void function(GLenum stage, GLenum pname, GLfloat *params);
alias PFNGLGETCOMBINERSTAGEPARAMETERFVNVPROC = void function(GLenum stage, GLenum pname, GLfloat *params);

/* GL_NV_vertex_program */
alias PFNGLAREPROGRAMSRESIDENTNVPROC = GLboolean function(GLsizei n, GLuint *programs, GLboolean *residences);
alias PFNGLBINDPROGRAMNVPROC = void function(GLenum target, GLuint id);
alias PFNGLDELETEPROGRAMSNVPROC = void function(GLsizei n, GLuint *programs);
alias PFNGLEXECUTEPROGRAMNVPROC = void function(GLenum target, GLuint id, GLfloat *params);
alias PFNGLGENPROGRAMSNVPROC = void function(GLsizei n, GLuint *programs);
alias PFNGLGETPROGRAMPARAMETERDVNVPROC = void function(GLenum target, GLuint index, GLenum pname, GLdouble *params);
alias PFNGLGETPROGRAMPARAMETERFVNVPROC = void function(GLenum target, GLuint index, GLenum pname, GLfloat *params);
alias PFNGLGETPROGRAMIVNVPROC = void function(GLuint id, GLenum pname, GLint *params);
alias PFNGLGETPROGRAMSTRINGNVPROC = void function(GLuint id, GLenum pname, GLubyte *program);
alias PFNGLGETTRACKMATRIXIVNVPROC = void function(GLenum target, GLuint address, GLenum pname, GLint *params);
alias PFNGLGETVERTEXATTRIBDVNVPROC = void function(GLuint index, GLenum pname, GLdouble *params);
alias PFNGLGETVERTEXATTRIBFVNVPROC = void function(GLuint index, GLenum pname, GLfloat *params);
alias PFNGLGETVERTEXATTRIBIVNVPROC = void function(GLuint index, GLenum pname, GLint *params);
alias PFNGLGETVERTEXATTRIBPOINTERVNVPROC = void function(GLuint index, GLenum pname, GLvoid* *pointer);
alias PFNGLISPROGRAMNVPROC = GLboolean function(GLuint id);
alias PFNGLLOADPROGRAMNVPROC = void function(GLenum target, GLuint id, GLsizei len, GLubyte *program);
alias PFNGLPROGRAMPARAMETER4DNVPROC = void function(GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
alias PFNGLPROGRAMPARAMETER4DVNVPROC = void function(GLenum target, GLuint index, GLdouble *v);
alias PFNGLPROGRAMPARAMETER4FNVPROC = void function(GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
alias PFNGLPROGRAMPARAMETER4FVNVPROC = void function(GLenum target, GLuint index, GLfloat *v);
alias PFNGLPROGRAMPARAMETERS4DVNVPROC = void function(GLenum target, GLuint index, GLuint count, GLdouble *v);
alias PFNGLPROGRAMPARAMETERS4FVNVPROC = void function(GLenum target, GLuint index, GLuint count, GLfloat *v);
alias PFNGLREQUESTRESIDENTPROGRAMSNVPROC = void function(GLsizei n, GLuint *programs);
alias PFNGLTRACKMATRIXNVPROC = void function(GLenum target, GLuint address, GLenum matrix, GLenum transform);
alias PFNGLVERTEXATTRIBPOINTERNVPROC = void function(GLuint index, GLint fsize, GLenum type, GLsizei stride, GLvoid *pointer);
alias PFNGLVERTEXATTRIB1DNVPROC = void function(GLuint index, GLdouble x);
alias PFNGLVERTEXATTRIB1DVNVPROC = void function(GLuint index, GLdouble *v);
alias PFNGLVERTEXATTRIB1FNVPROC = void function(GLuint index, GLfloat x);
alias PFNGLVERTEXATTRIB1FVNVPROC = void function(GLuint index, GLfloat *v);
alias PFNGLVERTEXATTRIB1SNVPROC = void function(GLuint index, GLshort x);
alias PFNGLVERTEXATTRIB1SVNVPROC = void function(GLuint index, GLshort *v);
alias PFNGLVERTEXATTRIB2DNVPROC = void function(GLuint index, GLdouble x, GLdouble y);
alias PFNGLVERTEXATTRIB2DVNVPROC = void function(GLuint index, GLdouble *v);
alias PFNGLVERTEXATTRIB2FNVPROC = void function(GLuint index, GLfloat x, GLfloat y);
alias PFNGLVERTEXATTRIB2FVNVPROC = void function(GLuint index, GLfloat *v);
alias PFNGLVERTEXATTRIB2SNVPROC = void function(GLuint index, GLshort x, GLshort y);
alias PFNGLVERTEXATTRIB2SVNVPROC = void function(GLuint index, GLshort *v);
alias PFNGLVERTEXATTRIB3DNVPROC = void function(GLuint index, GLdouble x, GLdouble y, GLdouble z);
alias PFNGLVERTEXATTRIB3DVNVPROC = void function(GLuint index, GLdouble *v);
alias PFNGLVERTEXATTRIB3FNVPROC = void function(GLuint index, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLVERTEXATTRIB3FVNVPROC = void function(GLuint index, GLfloat *v);
alias PFNGLVERTEXATTRIB3SNVPROC = void function(GLuint index, GLshort x, GLshort y, GLshort z);
alias PFNGLVERTEXATTRIB3SVNVPROC = void function(GLuint index, GLshort *v);
alias PFNGLVERTEXATTRIB4DNVPROC = void function(GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
alias PFNGLVERTEXATTRIB4DVNVPROC = void function(GLuint index, GLdouble *v);
alias PFNGLVERTEXATTRIB4FNVPROC = void function(GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
alias PFNGLVERTEXATTRIB4FVNVPROC = void function(GLuint index, GLfloat *v);
alias PFNGLVERTEXATTRIB4SNVPROC = void function(GLuint index, GLshort x, GLshort y, GLshort z, GLshort w);
alias PFNGLVERTEXATTRIB4SVNVPROC = void function(GLuint index, GLshort *v);
alias PFNGLVERTEXATTRIB4UBNVPROC = void function(GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w);
alias PFNGLVERTEXATTRIB4UBVNVPROC = void function(GLuint index, GLubyte *v);
alias PFNGLVERTEXATTRIBS1DVNVPROC = void function(GLuint index, GLsizei count, GLdouble *v);
alias PFNGLVERTEXATTRIBS1FVNVPROC = void function(GLuint index, GLsizei count, GLfloat *v);
alias PFNGLVERTEXATTRIBS1SVNVPROC = void function(GLuint index, GLsizei count, GLshort *v);
alias PFNGLVERTEXATTRIBS2DVNVPROC = void function(GLuint index, GLsizei count, GLdouble *v);
alias PFNGLVERTEXATTRIBS2FVNVPROC = void function(GLuint index, GLsizei count, GLfloat *v);
alias PFNGLVERTEXATTRIBS2SVNVPROC = void function(GLuint index, GLsizei count, GLshort *v);
alias PFNGLVERTEXATTRIBS3DVNVPROC = void function(GLuint index, GLsizei count, GLdouble *v);
alias PFNGLVERTEXATTRIBS3FVNVPROC = void function(GLuint index, GLsizei count, GLfloat *v);
alias PFNGLVERTEXATTRIBS3SVNVPROC = void function(GLuint index, GLsizei count, GLshort *v);
alias PFNGLVERTEXATTRIBS4DVNVPROC = void function(GLuint index, GLsizei count, GLdouble *v);
alias PFNGLVERTEXATTRIBS4FVNVPROC = void function(GLuint index, GLsizei count, GLfloat *v);
alias PFNGLVERTEXATTRIBS4SVNVPROC = void function(GLuint index, GLsizei count, GLshort *v);
alias PFNGLVERTEXATTRIBS4UBVNVPROC = void function(GLuint index, GLsizei count, GLubyte *v);

/* GL_ATI_envmap_bumpmap */
alias PFNGLTEXBUMPPARAMETERIVATIPROC = void function(GLenum pname, GLint *param);
alias PFNGLTEXBUMPPARAMETERFVATIPROC = void function(GLenum pname, GLfloat *param);
alias PFNGLGETTEXBUMPPARAMETERIVATIPROC = void function(GLenum pname, GLint *param);
alias PFNGLGETTEXBUMPPARAMETERFVATIPROC = void function(GLenum pname, GLfloat *param);

/* GL_ATI_fragment_shader */
alias PFNGLGENFRAGMENTSHADERSATIPROC = GLuint function(GLuint range);
alias PFNGLBINDFRAGMENTSHADERATIPROC = void function(GLuint id);
alias PFNGLDELETEFRAGMENTSHADERATIPROC = void function(GLuint id);
alias PFNGLBEGINFRAGMENTSHADERATIPROC = void function();
alias PFNGLENDFRAGMENTSHADERATIPROC = void function();
alias PFNGLPASSTEXCOORDATIPROC = void function(GLuint dst, GLuint coord, GLenum swizzle);
alias PFNGLSAMPLEMAPATIPROC = void function(GLuint dst, GLuint interp, GLenum swizzle);
alias PFNGLCOLORFRAGMENTOP1ATIPROC = void function(GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod);
alias PFNGLCOLORFRAGMENTOP2ATIPROC = void function(GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod);
alias PFNGLCOLORFRAGMENTOP3ATIPROC = void function(GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod);
alias PFNGLALPHAFRAGMENTOP1ATIPROC = void function(GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod);
alias PFNGLALPHAFRAGMENTOP2ATIPROC = void function(GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod);
alias PFNGLALPHAFRAGMENTOP3ATIPROC = void function(GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod);
alias PFNGLSETFRAGMENTSHADERCONSTANTATIPROC = void function(GLuint dst, GLfloat *value);

/* GL_ATI_pn_triangles */
alias PFNGLPNTRIANGLESIATIPROC = void function(GLenum pname, GLint param);
alias PFNGLPNTRIANGLESFATIPROC = void function(GLenum pname, GLfloat param);

/* GL_ATI_vertex_array_object */
alias PFNGLNEWOBJECTBUFFERATIPROC = GLuint function(GLsizei size, GLvoid *pointer, GLenum usage);
alias PFNGLISOBJECTBUFFERATIPROC = GLboolean function(GLuint buffer);
alias PFNGLUPDATEOBJECTBUFFERATIPROC = void function(GLuint buffer, GLuint offset, GLsizei size, GLvoid *pointer, GLenum preserve);
alias PFNGLGETOBJECTBUFFERFVATIPROC = void function(GLuint buffer, GLenum pname, GLfloat *params);
alias PFNGLGETOBJECTBUFFERIVATIPROC = void function(GLuint buffer, GLenum pname, GLint *params);
alias PFNGLDELETEOBJECTBUFFERATIPROC = void function(GLuint buffer);
alias PFNGLARRAYOBJECTATIPROC = void function(GLenum array, GLint size, GLenum type, GLsizei stride, GLuint buffer, GLuint offset);
alias PFNGLGETARRAYOBJECTFVATIPROC = void function(GLenum array, GLenum pname, GLfloat *params);
alias PFNGLGETARRAYOBJECTIVATIPROC = void function(GLenum array, GLenum pname, GLint *params);
alias PFNGLVARIANTARRAYOBJECTATIPROC = void function(GLuint id, GLenum type, GLsizei stride, GLuint buffer, GLuint offset);
alias PFNGLGETVARIANTARRAYOBJECTFVATIPROC = void function(GLuint id, GLenum pname, GLfloat *params);
alias PFNGLGETVARIANTARRAYOBJECTIVATIPROC = void function(GLuint id, GLenum pname, GLint *params);

/* GL_ATI_vertex_streams */
alias PFNGLVERTEXSTREAM1SATIPROC = void function(GLenum stream, GLshort x);
alias PFNGLVERTEXSTREAM1SVATIPROC = void function(GLenum stream, GLshort *coords);
alias PFNGLVERTEXSTREAM1IATIPROC = void function(GLenum stream, GLint x);
alias PFNGLVERTEXSTREAM1IVATIPROC = void function(GLenum stream, GLint *coords);
alias PFNGLVERTEXSTREAM1FATIPROC = void function(GLenum stream, GLfloat x);
alias PFNGLVERTEXSTREAM1FVATIPROC = void function(GLenum stream, GLfloat *coords);
alias PFNGLVERTEXSTREAM1DATIPROC = void function(GLenum stream, GLdouble x);
alias PFNGLVERTEXSTREAM1DVATIPROC = void function(GLenum stream, GLdouble *coords);
alias PFNGLVERTEXSTREAM2SATIPROC = void function(GLenum stream, GLshort x, GLshort y);
alias PFNGLVERTEXSTREAM2SVATIPROC = void function(GLenum stream, GLshort *coords);
alias PFNGLVERTEXSTREAM2IATIPROC = void function(GLenum stream, GLint x, GLint y);
alias PFNGLVERTEXSTREAM2IVATIPROC = void function(GLenum stream, GLint *coords);
alias PFNGLVERTEXSTREAM2FATIPROC = void function(GLenum stream, GLfloat x, GLfloat y);
alias PFNGLVERTEXSTREAM2FVATIPROC = void function(GLenum stream, GLfloat *coords);
alias PFNGLVERTEXSTREAM2DATIPROC = void function(GLenum stream, GLdouble x, GLdouble y);
alias PFNGLVERTEXSTREAM2DVATIPROC = void function(GLenum stream, GLdouble *coords);
alias PFNGLVERTEXSTREAM3SATIPROC = void function(GLenum stream, GLshort x, GLshort y, GLshort z);
alias PFNGLVERTEXSTREAM3SVATIPROC = void function(GLenum stream, GLshort *coords);
alias PFNGLVERTEXSTREAM3IATIPROC = void function(GLenum stream, GLint x, GLint y, GLint z);
alias PFNGLVERTEXSTREAM3IVATIPROC = void function(GLenum stream, GLint *coords);
alias PFNGLVERTEXSTREAM3FATIPROC = void function(GLenum stream, GLfloat x, GLfloat y, GLfloat z);
alias PFNGLVERTEXSTREAM3FVATIPROC = void function(GLenum stream, GLfloat *coords);
alias PFNGLVERTEXSTREAM3DATIPROC = void function(GLenum stream, GLdouble x, GLdouble y, GLdouble z);
alias PFNGLVERTEXSTREAM3DVATIPROC = void function(GLenum stream, GLdouble *coords);
alias PFNGLVERTEXSTREAM4SATIPROC = void function(GLenum stream, GLshort x, GLshort y, GLshort z, GLshort w);
alias PFNGLVERTEXSTREAM4SVATIPROC = void function(GLenum stream, GLshort *coords);
alias PFNGLVERTEXSTREAM4IATIPROC = void function(GLenum stream, GLint x, GLint y, GLint z, GLint w);
alias PFNGLVERTEXSTREAM4IVATIPROC = void function(GLenum stream, GLint *coords);
alias PFNGLVERTEXSTREAM4FATIPROC = void function(GLenum stream, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
alias PFNGLVERTEXSTREAM4FVATIPROC = void function(GLenum stream, GLfloat *coords);
alias PFNGLVERTEXSTREAM4DATIPROC = void function(GLenum stream, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
alias PFNGLVERTEXSTREAM4DVATIPROC = void function(GLenum stream, GLdouble *coords);
alias PFNGLNORMALSTREAM3BATIPROC = void function(GLenum stream, GLbyte nx, GLbyte ny, GLbyte nz);
alias PFNGLNORMALSTREAM3BVATIPROC = void function(GLenum stream, GLbyte *coords);
alias PFNGLNORMALSTREAM3SATIPROC = void function(GLenum stream, GLshort nx, GLshort ny, GLshort nz);
alias PFNGLNORMALSTREAM3SVATIPROC = void function(GLenum stream, GLshort *coords);
alias PFNGLNORMALSTREAM3IATIPROC = void function(GLenum stream, GLint nx, GLint ny, GLint nz);
alias PFNGLNORMALSTREAM3IVATIPROC = void function(GLenum stream, GLint *coords);
alias PFNGLNORMALSTREAM3FATIPROC = void function(GLenum stream, GLfloat nx, GLfloat ny, GLfloat nz);
alias PFNGLNORMALSTREAM3FVATIPROC = void function(GLenum stream, GLfloat *coords);
alias PFNGLNORMALSTREAM3DATIPROC = void function(GLenum stream, GLdouble nx, GLdouble ny, GLdouble nz);
alias PFNGLNORMALSTREAM3DVATIPROC = void function(GLenum stream, GLdouble *coords);
alias PFNGLCLIENTACTIVEVERTEXSTREAMATIPROC = void function(GLenum stream);
alias PFNGLVERTEXBLENDENVIATIPROC = void function(GLenum pname, GLint param);
alias PFNGLVERTEXBLENDENVFATIPROC = void function(GLenum pname, GLfloat param);

/* GL_ATI_element_array */
alias PFNGLELEMENTPOINTERATIPROC = void function(GLenum type, GLvoid *pointer);
alias PFNGLDRAWELEMENTARRAYATIPROC = void function(GLenum mode, GLsizei count);
alias PFNGLDRAWRANGEELEMENTARRAYATIPROC = void function(GLenum mode, GLuint start, GLuint end, GLsizei count);

/* GL_SUN_mesh_array */
alias PFNGLDRAWMESHARRAYSSUNPROC = void function(GLenum mode, GLint first, GLsizei count, GLsizei width);

/* GL_NV_occlusion_query */
alias PFNGLGENOCCLUSIONQUERIESNVPROC = void function(GLsizei n, GLuint *ids);
alias PFNGLDELETEOCCLUSIONQUERIESNVPROC = void function(GLsizei n, GLuint *ids);
alias PFNGLISOCCLUSIONQUERYNVPROC = GLboolean function(GLuint id);
alias PFNGLBEGINOCCLUSIONQUERYNVPROC = void function(GLuint id);
alias PFNGLENDOCCLUSIONQUERYNVPROC = void function();
alias PFNGLGETOCCLUSIONQUERYIVNVPROC = void function(GLuint id, GLenum pname, GLint *params);
alias PFNGLGETOCCLUSIONQUERYUIVNVPROC = void function(GLuint id, GLenum pname, GLuint *params);

/* GL_NV_pixel_data_range */
alias PFNGLPIXELDATARANGENVPROC = void function(GLenum target, GLsizei length, GLvoid *pointer);
alias PFNGLFLUSHPIXELDATARANGENVPROC = void function(GLenum target);

/* GL_NV_point_sprite */
alias PFNGLPOINTPARAMETERINVPROC = void function(GLenum pname, GLint param);
alias PFNGLPOINTPARAMETERIVNVPROC = void function(GLenum pname, GLint *params);
