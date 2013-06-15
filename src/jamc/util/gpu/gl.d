module jamc.util.gpu.gl;

import std.exception;
import std.range;
import std.string;
import std.traits;
import std.typecons;

public import GL.gl;
public import jamc.util.gpu.glConstants;

/// Nahraje všechny OGL rozšíření, co tu jsou.
/// \return Počet nahraných funkcí
int loadGLFunctions()
{
    int n;
    foreach( member; __traits( allMembers, jamc.util.gpu.gl ) )
    {
        static if( is( typeof( mixin( member ) ) ) ) 
        foreach( attr; __traits( getAttributes, mixin( member ) ) )
        {
            static if( isInstanceOf!( LoadGL, attr ) )
            {   
                loadSingleGLFunction( mixin( member ), attr.names );
                n++;
            }
        }
    }
    
    glPushBuffer( GL_ARRAY_BUFFER, 0 );
    glPushBuffer( GL_ELEMENT_ARRAY_BUFFER, 0 );
    
    return n;
}
    
void loadSingleGLFunction( T )( out T target, string[] names... )
{
    foreach( name; names )
    {
        target = cast( T ) glGetProcAddress( toStringz( name ) );
        if( target !is null )
        {
            break;
        }
    }
    
    enforce( target, "Could not load OpenGL function '" ~ names[0] ~ "'" );
}

struct LoadGL( inNames... )
{
    alias names = inNames;
}

template GLF(F)
{
    alias GLF = SetFunctionAttributes!( F, "C", functionAttributes!F );
}

alias GLintptr = size_t;
alias GLsizeiptr = size_t;

version(Windows)
{
    // Winows
    extern(System) void function() wglGetProcAddress( const(char)* proc );
    alias glGetProcAddress = wglGetProcAddress;
}
else
{
    // ostatni, na X zalozene, OS
    extern(System) void function() glXGetProcAddress( const(char)* proc );
    alias glGetProcAddress = glXGetProcAddress;
}

/*
@LoadGL!( "glEnableClientState" )
void function( GLenum cap ) glEnableClientState;

@LoadGL!( "glDisableClientState" )
void function( GLenum cap ) glDisableClientState;*/

@LoadGL!( "glBindBuffer", "glBindBufferARB" ) 
GLF!(void function(GLenum target, GLuint buffer)) glBindBuffer;

@LoadGL!( "glDeleteBuffers", "glDeleteBuffersARB" ) 
GLF!(void function(GLsizei n, const GLuint* buffers)) glDeleteBuffers;

@LoadGL!( "glGenBuffers", "glGenBuffersARB" ) 
GLF!(void function(GLsizei n, GLuint* buffers)) glGenBuffers;

@LoadGL!( "glIsBuffer", "glIsBufferARB" ) 
GLF!(GLboolean function(GLuint buffer)) glIsBuffer;

@LoadGL!( "glBufferData", "glBufferDataARB" ) 
GLF!(void function(GLenum target, GLsizeiptr size, const GLvoid* data, GLenum usage)) glBufferData;

@LoadGL!( "glBufferSubData", "glBufferSubDataARB" )
GLF!(void function(GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid* data)) glBufferSubData;

@LoadGL!( "glGetBufferSubData", "glGetBufferSubDataARB" )
GLF!(void function(GLenum target, GLintptr offset, GLsizeiptr size, GLvoid* data)) glGetBufferSubData;

@LoadGL!( "glMapBuffer", "glMapBufferARB" )
GLF!(GLvoid* function(GLenum target, GLenum access)) glMapBuffer;

@LoadGL!( "glUnmapBuffer", "glUnmapBufferARB" )
GLF!(GLboolean function(GLenum target)) glUnmapBuffer;

@LoadGL!( "glGetBufferParameteriv", "glGetBufferParameterivARB" )
GLF!(void function(GLenum target, GLenum pname, GLint* params)) glGetBufferParameteriv;

@LoadGL!( "glGetBufferPointerv", "glGetBufferPointervARB" )
GLF!(void function(GLenum target, GLenum pname, GLvoid** params)) glGetBufferPointerv;

@LoadGL!( "glDrawRangeElements", "glDrawRangeElementsARB" )
GLF!(void function(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const GLvoid *indices)) glDrawRangeElements;

// Naše vlastní "rozšíření"

void glPushBuffer( GLenum target, GLuint buffer )
{
    glBindBuffer( target, buffer );
    m_bufferStack[ target ] ~= buffer;
}

void glPopBuffer( GLenum target )
{
    m_bufferStack[ target ].length--;
    glBindBuffer( target, m_bufferStack[ target ].back );
}

void* glToOffset( T )( T x )
{
    return cast(void*) x;
}

private static GLuint[][GLenum] m_bufferStack;
