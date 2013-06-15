module jamc.api.network;

import std.array;
import std.bitmanip;
import std.traits;

// Někde zde by také měl být síťový interface.
// interface INetwork{ ...?... }

/**
 * Zakóduje paket a id paketu do pole bajtů.
 * Paket může být: 
 *   - primitivní datový typ
 *   - statické pole
 *   - dynamické pole
 *   - asociativní pole
 *   - struktura
 * 
 * Kódování ukazatelů je zakázáno kvůli možným cyklickým referencím.
 * Kódování tříd je zakázáno kvůli polymorfismu.
 * 
 * \param id Identifikační číslo paketu
 * \param data Zakódovaná data
 * \return Pole bajtů reprezentující id a data, dekódovatelné pomocí packetDecode
 */
ubyte[] packetEncode( T )( uint id, in T data )
in
{
    assert( id < 32767 );
}
body
{
    Appender!( ubyte[] ) app;
    
    if( id < 0x80 )
    {
        dataEncode( app, cast( ubyte )( id ) );
    }
    else
    {
        dataEncode( app, cast( ubyte )( ( id | 0x80 ) & 0xFF ) );
        dataEncode( app, cast( ubyte )( ( id >>> 7 ) & 0xFF ) );
    }
    
    dataEncode( app, data );
    return app.data();
}

ubyte[] packetEncode()( uint id ){
    Appender!( ubyte[] ) app;
    
    if( id < 0x80 )
    {
        dataEncode( app, cast( ubyte )( id ) );
    }
    else
    {
        dataEncode( app, cast( ubyte )( ( id | 0x80 ) & 0xFF ) );
        dataEncode( app, cast( ubyte )( ( id >>> 7 ) & 0xFF ) );
    }
    
    return app.data();
}
   
/**
 * Dekóduje pole bajtů zakódované pomocí packetEncode
 * na ID paketu a jeho data.
 * 
 * Data musí splňovat stejné podmínky jako v případě packetEncode.
 * 
 * Není prováděna žádná kontrola typů.
 * 
 * \param id Vrací ID paketu
 * \param data Vrací data
 * \param packet Vstupní zakódované pole bajtů
 */
void packetDecodeId( out uint id, ubyte[] packet )
{
    //writefln( "Dekóduji %s z %sB", typeid( T ), packet.length );
    
    id = packet[0] & 0x7F;
    
    if( packet[0] & 0x80 )
    {
        id |= packet[1] << 7;
    }
}

uint packetDecodeId( ubyte[] packet ){
    uint id;
    packetDecodeId( id, packet );
    return id;
}

void packetDecodeData( T )( ref T data, ubyte[] packet )
{
    if( packet[0] & 0x80 )
    {
        packet = packet[ 1..$ ];
    }
    
    dataDecode!T( data, packet[ 1..$ ] );
}
    
private
{
    void dataEncode( T )( ref Appender!( ubyte[] ) app, in T data )
    if( __traits( compiles, nativeToLittleEndian( data ) ) )
    {
        app.put( nativeToLittleEndian( data )[] );
    }

    void dataEncode( T, size_t n )( ref Appender!( ubyte[] ) app, in T[n] data )
    {
        foreach( e; data )
        {
            dataEncode( app, e );
        }
    }

    void dataEncode( T )( ref Appender!( ubyte[] ) app, in T[] data )
    {
        // cast je nutný, jelikož délka pole je size_t, což může být 4B nebo 8B
        dataEncode( app, cast( uint ) data.length ); 
        
        foreach( e; data )
        {
            dataEncode( app, e );
        }
    }

    void dataEncode( V, K )( ref Appender!( ubyte[] ) app, in V[K] data )
    {
        dataEncode( app, cast( uint ) data.length ); 
        
        foreach( i, e; data )
        {
            dataEncode( app, i );
            dataEncode( app, e );
        }
    }

    void dataEncode( T )( ref Appender!( ubyte[] ) app, in T data )
    if( is( T == struct ) )
    {
        foreach( member; data.tupleof )
        {
            dataEncode( app, member );
        }
    }

    void dataDecode( T )( out T data, ubyte[] packet )
    if( isScalarType!T )
    {
        ubyte[T.sizeof] raw = packet[ 0..T.sizeof ];
        data = littleEndianToNative!T( raw );
        packet = packet[ T.sizeof..$ ];
    }
    
    void dataDecode( T, size_t n )( out T[n] data, ubyte[] packet )
    {
        foreach( i; 0..data.length )
        {
            dataDecode( data[i], packet );
        }
    }
    
    void dataDecode( T )( out T[] data, ubyte[] packet )
    {
        uint length;
        dataDecode( length, packet );
        
        data.reserve( length );
        
        foreach( i; 0..length )
        {
            Unqual!T val;
            dataDecode( val, packet );
            data ~= val;
        }
    }

    void dataDecode( V, K )( out V[K] data, ubyte[] packet )
    {
        uint length;
        dataDecode( length, packet );
        
        foreach( i; 0..length )
        {
            Unqual!K key;
            Unqual!V val;
            dataDecode( key, packet );
            dataDecode( val, packet );
            data[ key ] = val;
        }
    }

    void dataDecode( T )( out T data, ubyte[] packet )
    if( is( T == struct ) )
    {
        foreach( ref member; data.tupleof )
        {
            dataDecode( member, packet );
        }
    }
}

unittest
{
    void test( T )( uint id, T val )
    {
        ubyte[] packet = packetEncode( id, val );
        assert( id == packetDecodeId( packet ) );
        T outVal;
        packetDecodeData( outVal, packet );
        assert( outVal == val );
        
    }
    
    static struct S1{ int a; double b; }
    static struct S2{ 
        string a; float[] b; int[string] c;
        bool opEquals( S2 that )
        {
            return a == that.a &&
                   b == that.b &&
                   c == that.c;
        }
    }
     

    test( 20, 57.34 );
    /*test( 1000, 13.37 );
    test( 2000, [ 1, 2, 3, 4, 5, 6 ] );
    test( 3000, [ "ahoj": 20, "nazdar": 30, "foo": 40, "bar": 50 ] );
    test( 4000, S1( 3000, 3000.3 ) );
    test( 5000, [ S1( 3, 3.3 ), S1( 4, 4.4 ), S1( 5, 5.5 ) ] );    
    test( 6000, S2( "test", [ 1.1, 2.2, 3.3, 4.4, 5.5 ], 
                    [ "a":1, "b":2, "c":3, "d":4, "e":5 ] ) );*/
                    
    enum E1
    {
        a, b, c, d
    }
    
    test( 7000, E1.a );
}
