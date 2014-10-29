module jamc.util.gpu.gl;

import std.exception;
import std.range;
import std.string;
import std.traits;
import std.typecons;

public import derelict.opengl3.gl;

void initGlExtensions()
{
	glCall!glPushBuffer( GL_ARRAY_BUFFER, 0 );
    glCall!glPushBuffer( GL_ELEMENT_ARRAY_BUFFER, 0 );
}

auto glCall(alias F, Params...)(Params params)
{
	scope(exit)
	{
		GLenum err;
		while ((err = glGetError()) != GL_NO_ERROR)
		{
			import std.stdio : stderr;
			auto fName = __traits(identifier, F);
			stderr.writefln("%s: %x - %s", fName, err, translateGlError(err));
		}
	}

	return F(params);
}

string translateGlError(GLenum err)
{
	foreach (errName; TypeTuple!(
		"GL_INVALID_ENUM", 
		"GL_INVALID_VALUE", 
		"GL_INVALID_OPERATION", 
		"GL_STACK_OVERFLOW", 
		"GL_STACK_UNDERFLOW", 
		"GL_OUT_OF_MEMORY",
		"GL_INVALID_FRAMEBUFFER_OPERATION"
	))
	{
		if (err == mixin(errName))
		{
			return errName;
		}
	}
	
	assert(false, "Invalid GL err");
}

// Naše vlastní "rozšíření"

void glPushBuffer( GLenum target, GLuint buffer )
{
    glCall!glBindBuffer( target, buffer );
    m_bufferStack[ target ] ~= buffer;
}

void glPopBuffer( GLenum target )
{
    m_bufferStack[ target ].length--;
    glCall!glBindBuffer( target, m_bufferStack[ target ].back );
}

void* glToOffset( T )( T x )
{
    return cast(void*) x;
}

private static GLuint[][GLenum] m_bufferStack;
