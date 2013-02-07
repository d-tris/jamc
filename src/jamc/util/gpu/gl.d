module jamc.util.gpu.gl;

import std.exception;
import std.range;
import std.string;
import std.traits;
import std.typecons;

public import GL.gl;

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
    
    target = enforce( target );
}

struct LoadGL( inNames... )
{
    alias names = inNames;
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
    // ostatni na X zalozene OS
    extern(System) void function() glXGetProcAddress( const(char)* proc );
    alias glGetProcAddress = glXGetProcAddress;
}

@LoadGL!( "glBindBuffer", "glBindBufferARB" ) 
void function(GLenum target, GLuint buffer) glBindBuffer;

@LoadGL!( "glDeleteBuffers", "glDeleteBuffersARB" ) 
void function(GLsizei n, const GLuint* buffers) glDeleteBuffers;

@LoadGL!( "glGenBuffers", "glGenBuffersARB" ) 
void function(GLsizei n, GLuint* buffers) glGenBuffers;

@LoadGL!( "glIsBuffer", "glIsBufferARB" ) 
GLboolean function(GLuint buffer) glIsBuffer;

@LoadGL!( "glBufferData", "glBufferDataARB" ) 
void function(GLenum target, GLsizeiptr size, const GLvoid* data, GLenum usage) glBufferData;

@LoadGL!( "glBufferSubData", "glBufferSubDataARB" )
void function(GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid* data) glBufferSubData;

@LoadGL!( "glGetBufferSubData", "glGetBufferSubDataARB" )
void function(GLenum target, GLintptr offset, GLsizeiptr size, GLvoid* data) glGetBufferSubData;

@LoadGL!( "glMapBuffer", "glMapBufferARB" )
GLvoid* function(GLenum target, GLenum access) glMapBuffer;

@LoadGL!( "glUnmapBuffer", "glUnmapBufferARB" )
GLboolean function(GLenum target) glUnmapBuffer;

@LoadGL!( "glGetBufferParameteriv", "glGetBufferParameterivARB" )
void function(GLenum target, GLenum pname, GLint* params) glGetBufferParameteriv;

@LoadGL!( "glGetBufferPointerv", "glGetBufferPointervARB" )
void function(GLenum target, GLenum pname, GLvoid** params) glGetBufferPointerv;

@LoadGL!( "glDrawRangeElements", "glDrawRangeElementsARB" )
void function(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const GLvoid *indices) glDrawRangeElements;

// Naše vlastní "rozšíření"

void pushBuffer( GLenum target, GLuint buffer )
{
    glBindBuffer( target, buffer );
    m_bufferStack[ target ] ~= buffer;
}

void popBuffer( GLenum target )
{
    m_bufferStack[ target ].length--;
    glBindBuffer( target, m_bufferStack[ target ].back() );
}

void* glToOffset( T )( T x )
{
    return cast(void*) x;
}

static GLuint[][GLenum] m_bufferStack;
