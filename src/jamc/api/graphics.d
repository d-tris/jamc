module jamc.api.graphics;

interface IGraphicsMgr
{
    void beginFrame();
    void finishFrame();
    @property OGL ogl();
}

version( OpenGL )
{
    import std.range;
    import jamc.api.game;
    import GL.gl;
    
    
    alias GLintptr = size_t;
    alias GLsizeiptr = size_t;

    class OGL
    {
        struct LoadGL( inNames... )
        {
            alias names = inNames;
        }

        alias clearIndex = glClearIndex;
        alias clearColor = glClearColor;
        alias clear = glClear;
        alias indexMask = glIndexMask;
        alias colorMask = glColorMask;
        alias alphaFunc = glAlphaFunc;
        alias blendFunc = glBlendFunc;
        alias logicOp = glLogicOp;
        alias cullFace = glCullFace;
        alias frontFace = glFrontFace;
        alias pointSize = glPointSize;
        alias lineWidth = glLineWidth;
        alias lineStipple = glLineStipple;
        alias polygonMode = glPolygonMode;
        alias polygonOffset = glPolygonOffset;
        alias polygonStipple = glPolygonStipple;
        alias getPolygonStipple = glGetPolygonStipple;
        alias edgeFlag = glEdgeFlag;
        alias edgeFlagv = glEdgeFlagv;
        alias scissor = glScissor;
        alias clipPlane = glClipPlane;
        alias getClipPlane = glGetClipPlane;
        alias drawBuffer = glDrawBuffer;
        alias readBuffer = glReadBuffer;
        alias enable = glEnable;
        alias disable = glDisable;
        alias isEnabled = glIsEnabled;
        alias enableClientState = glEnableClientState;  /* 1.1 */
        alias disableClientState = glDisableClientState;  /* 1.1 */
        alias getBooleanv = glGetBooleanv;
        alias getDoublev = glGetDoublev;
        alias getFloatv = glGetFloatv;
        alias getIntegerv = glGetIntegerv;
        alias pushAttrib = glPushAttrib;
        alias popAttrib = glPopAttrib;
        alias pushClientAttrib = glPushClientAttrib;  /* 1.1 */
        alias popClientAttrib = glPopClientAttrib;  /* 1.1 */
        alias renderMode = glRenderMode;
        alias getError = glGetError;
        alias getString = glGetString;
        alias finish = glFinish;
        alias flush = glFlush;
        alias hint = glHint;

    /* Depth Buffer */
        alias clearDepth = glClearDepth;
        alias depthFunc = glDepthFunc;
        alias depthMask = glDepthMask;
        alias depthRange = glDepthRange;

    /* Accumulation Buffer */
        alias clearAccum = glClearAccum;
        alias accum = glAccum;

    /* Transformation */
        alias matrixMode = glMatrixMode;
        alias ortho = glOrtho;
        alias frustum = glFrustum;
        alias viewport = glViewport;
        alias pushMatrix = glPushMatrix;
        alias popMatrix = glPopMatrix;
        alias loadIdentity = glLoadIdentity;
        alias loadMatrixd = glLoadMatrixd;
        alias loadMatrixf = glLoadMatrixf;
        alias multMatrixd = glMultMatrixd;
        alias multMatrixf = glMultMatrixf;
        alias rotated = glRotated;
        alias rotatef = glRotatef;
        alias scaled = glScaled;
        alias scalef = glScalef;
        alias translated = glTranslated;
        alias translatef = glTranslatef;

    /* Display Lists */
        alias isList = glIsList;
        alias deleteLists = glDeleteLists;
        alias genLists = glGenLists;
        alias newList = glNewList;
        alias endList = glEndList;
        alias callList = glCallList;
        alias callLists = glCallLists;
        alias listBase = glListBase;

    /* Drawing Functions */
        alias begin = glBegin;
        alias end = glEnd;
        alias vertex2d = glVertex2d;
        alias vertex2f = glVertex2f;
        alias vertex2i = glVertex2i;
        alias vertex2s = glVertex2s;
        alias vertex3d = glVertex3d;
        alias vertex3f = glVertex3f;
        alias vertex3i = glVertex3i;
        alias vertex3s = glVertex3s;
        alias vertex4d = glVertex4d;
        alias vertex4f = glVertex4f;
        alias vertex4i = glVertex4i;
        alias vertex4s = glVertex4s;
        alias vertex2dv = glVertex2dv;
        alias vertex2fv = glVertex2fv;
        alias vertex2iv = glVertex2iv;
        alias vertex2sv = glVertex2sv;
        alias vertex3dv = glVertex3dv;
        alias vertex3fv = glVertex3fv;
        alias vertex3iv = glVertex3iv;
        alias vertex3sv = glVertex3sv;
        alias vertex4dv = glVertex4dv;
        alias vertex4fv = glVertex4fv;
        alias vertex4iv = glVertex4iv;
        alias vertex4sv = glVertex4sv;
        alias normal3b = glNormal3b;
        alias normal3d = glNormal3d;
        alias normal3f = glNormal3f;
        alias normal3i = glNormal3i;
        alias normal3s = glNormal3s;
        alias normal3bv = glNormal3bv;
        alias normal3dv = glNormal3dv;
        alias normal3fv = glNormal3fv;
        alias normal3iv = glNormal3iv;
        alias normal3sv = glNormal3sv;
        alias indexd = glIndexd;
        alias indexf = glIndexf;
        alias indexi = glIndexi;
        alias indexs = glIndexs;
        alias indexub = glIndexub;  /* 1.1 */
        alias indexdv = glIndexdv;
        alias indexfv = glIndexfv;
        alias indexiv = glIndexiv;
        alias indexsv = glIndexsv;
        alias indexubv = glIndexubv;  /* 1.1 */
        alias color3b = glColor3b;
        alias color3d = glColor3d;
        alias color3f = glColor3f;
        alias color3i = glColor3i;
        alias color3s = glColor3s;
        alias color3ub = glColor3ub;
        alias color3ui = glColor3ui;
        alias color3us = glColor3us;
        alias color4b = glColor4b;
        alias color4d = glColor4d;
        alias color4f = glColor4f;
        alias color4i = glColor4i;
        alias color4s = glColor4s;
        alias color4ub = glColor4ub;
        alias color4ui = glColor4ui;
        alias color4us = glColor4us;
        alias color3bv = glColor3bv;
        alias color3dv = glColor3dv;
        alias color3fv = glColor3fv;
        alias color3iv = glColor3iv;
        alias color3sv = glColor3sv;
        alias color3ubv = glColor3ubv;
        alias color3uiv = glColor3uiv;
        alias color3usv = glColor3usv;
        alias color4bv = glColor4bv;
        alias color4dv = glColor4dv;
        alias color4fv = glColor4fv;
        alias color4iv = glColor4iv;
        alias color4sv = glColor4sv;
        alias color4ubv = glColor4ubv;
        alias color4uiv = glColor4uiv;
        alias color4usv = glColor4usv;
        alias texCoord1d = glTexCoord1d;
        alias texCoord1f = glTexCoord1f;
        alias texCoord1i = glTexCoord1i;
        alias texCoord1s = glTexCoord1s;
        alias texCoord2d = glTexCoord2d;
        alias texCoord2f = glTexCoord2f;
        alias texCoord2i = glTexCoord2i;
        alias texCoord2s = glTexCoord2s;
        alias TexCoord3d = glTexCoord3d;
        alias texCoord3f = glTexCoord3f;
        alias texCoord3i = glTexCoord3i;
        alias texCoord3s = glTexCoord3s;
        alias texCoord4d = glTexCoord4d;
        alias texCoord4f = glTexCoord4f;
        alias texCoord4i = glTexCoord4i;
        alias texCoord4s = glTexCoord4s;
        alias texCoord1dv = glTexCoord1dv;
        alias texCoord1fv = glTexCoord1fv;
        alias texCoord1iv = glTexCoord1iv;
        alias texCoord1sv = glTexCoord1sv;
        alias texCoord2dv = glTexCoord2dv;
        alias texCoord2fv = glTexCoord2fv;
        alias texCoord2iv = glTexCoord2iv;
        alias texCoord2sv = glTexCoord2sv;
        alias texCoord3dv = glTexCoord3dv;
        alias texCoord3fv = glTexCoord3fv;
        alias texCoord3iv = glTexCoord3iv;
        alias texCoord3sv = glTexCoord3sv;
        alias texCoord4dv = glTexCoord4dv;
        alias texCoord4fv = glTexCoord4fv;
        alias texCoord4iv = glTexCoord4iv;
        alias texCoord4sv = glTexCoord4sv;
        alias rasterPos2d = glRasterPos2d;
        alias rasterPos2f = glRasterPos2f;
        alias rasterPos2i = glRasterPos2i;
        alias rasterPos2s = glRasterPos2s;
        alias rasterPos3d = glRasterPos3d;
        alias rasterPos3f = glRasterPos3f;
        alias rasterPos3i = glRasterPos3i;
        alias rasterPos3s = glRasterPos3s;
        alias rasterPos4d = glRasterPos4d;
        alias rasterPos4f = glRasterPos4f;
        alias rasterPos4i = glRasterPos4i;
        alias rasterPos4s = glRasterPos4s;
        alias rasterPos2dv = glRasterPos2dv;
        alias rasterPos2fv = glRasterPos2fv;
        alias rasterPos2iv = glRasterPos2iv;
        alias rasterPos2sv = glRasterPos2sv;
        alias rasterPos3dv = glRasterPos3dv;
        alias rasterPos3fv = glRasterPos3fv;
        alias rasterPos3iv = glRasterPos3iv;
        alias rasterPos3sv = glRasterPos3sv;
        alias rasterPos4dv = glRasterPos4dv;
        alias rasterPos4fv = glRasterPos4fv;
        alias rasterPos4iv = glRasterPos4iv;
        alias rasterPos4sv = glRasterPos4sv;
        alias rectd = glRectd;
        alias rectf = glRectf;
        alias recti = glRecti;
        alias rects = glRects;
        alias rectdv = glRectdv;
        alias rectfv = glRectfv;
        alias rectiv = glRectiv;
        alias rectsv = glRectsv;

    /* Lighting */
        alias shadeModel = glShadeModel;
        alias lightf = glLightf;
        alias lighti = glLighti;
        alias lightfv = glLightfv;
        alias lightiv = glLightiv;
        alias getLightfv = glGetLightfv;
        alias getLightiv = glGetLightiv;
        alias lightModelf = glLightModelf;
        alias lightModeli = glLightModeli;
        alias lightModelfv = glLightModelfv;
        alias lightModeliv = glLightModeliv;
        alias materialf = glMaterialf;
        alias materiali = glMateriali;
        alias materialfv = glMaterialfv;
        alias materialiv = glMaterialiv;
        alias getMaterialfv = glGetMaterialfv;
        alias getMaterialiv = glGetMaterialiv;
        alias colorMaterial = glColorMaterial;

    /* Raster functions */
        alias pixelZoom = glPixelZoom;
        alias pixelStoref = glPixelStoref;
        alias pixelStorei = glPixelStorei;
        alias pixelTransferf = glPixelTransferf;
        alias pixelTransferi = glPixelTransferi;
        alias pixelMapfv = glPixelMapfv;
        alias pixelMapuiv = glPixelMapuiv;
        alias pixelMapusv = glPixelMapusv;
        alias getPixelMapfv = glGetPixelMapfv;
        alias getPixelMapuiv = glGetPixelMapuiv;
        alias getPixelMapusv = glGetPixelMapusv;
        alias bitmap = glBitmap;
        alias readPixels = glReadPixels;
        alias drawPixels = glDrawPixels;
        alias copyPixels = glCopyPixels;

    /* Stenciling */
        alias stencilFunc = glStencilFunc;
        alias stencilMask = glStencilMask;
        alias stencilOp = glStencilOp;
        alias clearStencil = glClearStencil;

    /* Texture mapping */
        alias texGend = glTexGend;
        alias texGenf = glTexGenf;
        alias texGeni = glTexGeni;
        alias texGendv = glTexGendv;
        alias texGenfv = glTexGenfv;
        alias texGeniv = glTexGeniv;
        alias getTexGendv = glGetTexGendv;
        alias getTexGenfv = glGetTexGenfv;
        alias getTexGeniv = glGetTexGeniv;
        alias texEnvf = glTexEnvf;
        alias texEnvi = glTexEnvi;
        alias texEnvfv = glTexEnvfv;
        alias texEnviv = glTexEnviv;
        alias getTexEnvfv = glGetTexEnvfv;
        alias getTexEnviv = glGetTexEnviv;
        alias texParameterf = glTexParameterf;
        alias texParameteri = glTexParameteri;
        alias texParameterfv = glTexParameterfv;
        alias texParameteriv = glTexParameteriv;
        alias getTexParameterfv = glGetTexParameterfv;
        alias getTexParameteriv = glGetTexParameteriv;
        alias getTexLevelParameterfv = glGetTexLevelParameterfv;
        alias getTexLevelParameteriv = glGetTexLevelParameteriv;
        alias texImage1D = glTexImage1D;
        alias texImage2D = glTexImage2D;
        alias getTexImage = glGetTexImage;

    /* Evaluators */
        alias map1d = glMap1d;
        alias map1f = glMap1f;
        alias map2d = glMap2d;
        alias map2f = glMap2f;
        alias getMapdv = glGetMapdv;
        alias getMapfv = glGetMapfv;
        alias getMapiv = glGetMapiv;
        alias evalCoord1d = glEvalCoord1d;
        alias evalCoord1f = glEvalCoord1f;
        alias evalCoord1dv = glEvalCoord1dv;
        alias evalCoord1fv = glEvalCoord1fv;
        alias evalCoord2d = glEvalCoord2d;
        alias evalCoord2f = glEvalCoord2f;
        alias evalCoord2dv = glEvalCoord2dv;
        alias evalCoord2fv = glEvalCoord2fv;
        alias mapGrid1d = glMapGrid1d;
        alias mapGrid1f = glMapGrid1f;
        alias mapGrid2d = glMapGrid2d;
        alias mapGrid2f = glMapGrid2f;
        alias evalPoint1 = glEvalPoint1;
        alias evalPoint2 = glEvalPoint2;
        alias evalMesh1 = glEvalMesh1;
        alias evalMesh2 = glEvalMesh2;

    /* Fog */
        alias fogf = glFogf;
        alias fogi = glFogi;
        alias fogfv = glFogfv;
        alias fogiv = glFogiv;

    /* Selection and Feedback */
        alias feedbackBuffer = glFeedbackBuffer;
        alias passThrough = glPassThrough;
        alias selectBuffer = glSelectBuffer;
        alias initNames = glInitNames;
        alias loadName = glLoadName;
        alias pushName = glPushName;
        alias popName = glPopName;


    /* OpenGL 1.1 functions */
    /* texture objects */
        alias genTextures = glGenTextures;
        alias deleteTextures = glDeleteTextures;
        alias bindTexture = glBindTexture;
        alias prioritizeTextures = glPrioritizeTextures;
        alias areTexturesResident = glAreTexturesResident;
        alias isTexture = glIsTexture;
    /* texture mapping */
        alias texSubImage1D = glTexSubImage1D;
        alias texSubImage2D = glTexSubImage2D;
        alias copyTexImage1D = glCopyTexImage1D;
        alias copyTexImage2D = glCopyTexImage2D;
        alias copyTexSubImage1D = glCopyTexSubImage1D;
        alias copyTexSubImage2D = glCopyTexSubImage2D;
    /* vertex arrays */
        alias vertexPointer = glVertexPointer;
        alias normalPointer = glNormalPointer;
        alias colorPointer = glColorPointer;
        alias indexPointer = glIndexPointer;
        alias texCoordPointer = glTexCoordPointer;
        alias edgeFlagPointer = glEdgeFlagPointer;
        alias getPointerv = glGetPointerv;
        alias arrayElement = glArrayElement;
        alias drawArrays = glDrawArrays;
        alias drawElements = glDrawElements;
        alias interleavedArrays = glInterleavedArrays;
        
        @LoadGL!( "glBindBuffer", "glBindBufferARB" ) 
        void function(GLenum target, GLuint buffer) bindBuffer;
        
        @LoadGL!( "glDeleteBuffers", "glDeleteBuffersARB" ) 
        void function(GLsizei n, const GLuint* buffers) deleteBuffers;
        
        @LoadGL!( "glGenBuffers", "glGenBuffersARB" ) 
        void function(GLsizei n, GLuint* buffers) genBuffers;
        
        @LoadGL!( "glIsBuffer", "glIsBufferARB" ) 
        GLboolean function(GLuint buffer) isBuffer;
        
        @LoadGL!( "glBufferData", "glBufferDataARB" ) 
        void function(GLenum target, GLsizeiptr size, const GLvoid* data, GLenum usage) bufferData;
        
        @LoadGL!( "glBufferSubData", "glBufferSubDataARB" )
        void function(GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid* data) bufferSubData;
        
        @LoadGL!( "glGetBufferSubData", "glGetBufferSubDataARB" )
        void function(GLenum target, GLintptr offset, GLsizeiptr size, GLvoid* data) getBufferSubData;
        
        @LoadGL!( "glMapBuffer", "glMapBufferARB" )
        GLvoid* function(GLenum target, GLenum access) mapBuffer;
        
        @LoadGL!( "glUnmapBuffer", "glUnmapBufferARB" )
        GLboolean function(GLenum target) unmapBuffer;
        
        @LoadGL!( "glGetBufferParameteriv", "glGetBufferParameterivARB" )
        void function(GLenum target, GLenum pname, GLint* params) getBufferParameteriv;
        
        @LoadGL!( "glGetBufferPointerv", "glGetBufferPointervARB" )
        void function(GLenum target, GLenum pname, GLvoid** params) getBufferPointerv;
        
        @LoadGL!( "glDrawRangeElements", "glDrawRangeElementsARB" )
        void function(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const GLvoid *indices) drawRangeElements;
        
        void pushBuffer( GLenum target, GLuint buffer )
        {
            bindBuffer( target, buffer );
            m_bufferStack[ target ] ~= buffer;
        }

        void popBuffer( GLenum target )
        {
            m_bufferStack[ target ].length--;
            bindBuffer( target, m_bufferStack[ target ].back() );
        }
        
        GLuint[][GLenum] m_bufferStack;
    }
}
else
{
    struct OGL {}
}
