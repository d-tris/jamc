module jamc.util.vector;

import std.array : join;
import std.math : sqrt;
import std.range : repeat, lockstep;
import std.traits;
import std.typetuple : TypeTuple;

import std.stdio;

mixin template VectorBase( T, size_t dim )
{
    import std.stdio;
    
    private:
    
    static string generateStorageType()
    {
        return "TypeTuple!( " ~ repeat( "T", dim ).join( ", " ) ~ " )";
    }
    
    mixin( q{ alias Storage = } ~ generateStorageType() ~ q{ ; });
    
    public:
    
    alias valueType = T;
    enum dimensions = dim;
    
    this( Storage init )
    {
        data = init;
    }
    
    /// Operace unarniho minus. Obraci smer vektoru.
    const typeof(this) opUnary( string op )()
    if( op == "-" )
    {
        Storage ret = data;
        foreach( ref e; ret )
        {
            e *= -1;
        }
        
        return typeof(this)( ret );
    }
    
    /// Operace vektoroveho souctu a rozdilu
    const typeof(this) opBinary( string op )( typeof(this) rhs ) const
    if( op == "+" || op == "-" )
    {
        Storage ret = data;
        foreach( i, ref e; ret )
        {
            mixin( "e " ~ op ~ "= rhs.data[i];" );
        }
        
        return typeof(this)( ret );
    }
    
    /// Operace nasobeni a deleni vektoru skalarem
    const typeof(this) opBinary( string op )( T rhs ) const
    if( op == "*" || op == "/" )
    {
        Storage ret = data;
        foreach( ref e; ret )
        {
            mixin( "e " ~ op ~ "= rhs;" );
        }
        
        return typeof(this)( ret );
    }
    
    /// Operace nasobeni skalarem 
    const typeof(this) opBinaryRight( string op )( T lhs ) const
    if( op == "*" )
    {
        Storage ret = data;
        foreach( ref e; ret )
        {
            e *= lhs;
        }
        
        return typeof(this)( ret );
    }
    
    /// Operace porovnani dvou vektoru
    bool opEquals()( auto ref const typeof(this) rhs ) inout
    {
        return data == rhs.data;
    }
    
    /// Operace pricteni a odecteni vektoru
    typeof(this) opOpAssign( string op )( typeof(this) rhs )
    if( op == "+" || op == "-" )
    {
        foreach( i, ref e; data )
        {
            mixin( "e " ~ op ~ "= rhs.data[i];" );
        }
        
        return this;
    }
    
    /// Operace vynasobeni a vydeleni vektoru skalarem
    typeof(this) opOpAssign( string op )( T rhs )
    if( op == "*" || op == "/" )
    {
        foreach( ref e; data )
        {
            mixin( "e " ~ op ~ "= rhs;" );
        }
        
        return this;
    }
    
    alias data this;
    
    private:
    
    Storage data;
}

struct Vector( T, size_t dim )
{
    mixin VectorBase!( T, dim );
    
    const T lengthSqr()
    {
        T sum = 0;
        foreach( x; data )
        {
            sum += x * x;
        }
        return sum;
    }
    
    T dot( const Vector rhs )
    {
        T sum = 0;
        foreach( i, ref e; data )
        {
            sum += e * rhs.data[i];
        }
        return sum;
    }
    
    static if( __traits( compiles, sqrt( T.init ) ) )
    {
        const T length()
        {
            return sqrt( lengthSqr() );
        }
        
        const Vector normalized()
        {
            Vector ret = this;
            ret.normalize();
            return ret;
        }
            
        void normalize()
        {
            auto lenInv = 1.0 / length();
            foreach( ref e; data )
            {
                e *= lenInv;
            }
        }
    } 
}

alias vec2i = Vector!( int, 2 );
alias vec3i = Vector!( int, 3 );
alias vec4i = Vector!( int, 4 );

alias vec2ui = Vector!( uint, 2 );
alias vec3ui = Vector!( uint, 3 );
alias vec4ui = Vector!( uint, 4 );

alias vec2f = Vector!( float, 2 );
alias vec3f = Vector!( float, 3 );
alias vec4f = Vector!( float, 4 );

alias vec2d = Vector!( double, 2 );
alias vec3d = Vector!( double, 3 );
alias vec4d = Vector!( double, 4 );

unittest
{
    // testy porovnani
    assert( vec2i( 11, 22 ) == vec2i( 11, 22 ) );
    assert( vec2i( 11, 22 ) != vec2i( 22, 11 ) );
    assert( vec2i( 500, 1000 ) == vec2i( 500, 1000 ) );
    
    // test prirazeni
    auto a = vec2i( 57, 64 );
    assert( a == vec2i( 57, 64 ) );
    
    // test scitani
    auto b = a + a;
    assert( b == vec2i( 114, 128 ) );
    
    // test pricitani
    auto c = a;
    c += a;
    assert( c == vec2i( 114, 128 ) );
    
    // test rozdilu
    auto d = a - a;
    assert( d == vec2i( 0, 0 ) );
        
    // test odecteni    
    auto e = a;
    e -= a;
    assert( e == vec2i( 0, 0 ) );
        
    // test nasobeni skalarem    
    auto f = a * 3;
    auto g = 3 * a;
    auto h = a;
    h *= 3;
    assert( f == g );
    assert( f == h );
    assert( f == vec2i( 171, 192 ) );
    
    assert( vec2i( 64, 128 ) / 4 == vec2i( 16, 32 ) );
    
    vec2i i;
    i[0] = 0;
    i[1] = 1;
    assert( i == vec2i( 0, 1 ) );
    
    assert( -vec2i( 10, 15 ) == vec2i( -10, -15 ) );
    
    assert( vec2i( 2, 4 ).lengthSqr() == 20 );
    
    assert( vec2d( 3.0, 4.0 ).length() == 5 );
}
