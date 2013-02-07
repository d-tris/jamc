module jamc.util.vector;

import std.traits;
import std.math;
import std.range;

mixin template VectorBase( T, size_t dim )
{
    alias valueType = T;
    enum dimensions = dim;
    
    this( const T[] init... )
    in
    {
        assert( init.length == dim );
    }
    body
    {
        data = init;
    }
    
    /// Operace unarniho minus. Obraci smer vektoru.
    const typeof(this) opUnary( string op )()
    if( op == "-" )
    {
        T[dim] ret = data;
        ret[] *= -1;
        return typeof(this)( ret );
    }
    
    /// Operace unarniho minus na prvku vektoru.
    const T opIndexUnary( string op )( size_t i )
    if( op == "-" )
    {
        return -data[ i ];
    }
    
    /// Operace vektoroveho souctu a rozdilu
    const typeof(this) opBinary( string op )( typeof(this) rhs ) const
    if( op == "+" || op == "-" )
    {
        T[dim] ret = data;
        mixin( "ret[] " ~ op ~ "= rhs.data[];" );
        
        return typeof(this)( ret );
    }
    
    /// Operace nasobeni a deleni vektoru skalarem
    const typeof(this) opBinary( string op )( T rhs ) const
    if( op == "*" || op == "/" )
    {
        T[dim] ret = data;
        mixin( "ret[] " ~ op ~ "= rhs;" );
        return typeof(this)( ret );
    }
    
    /// Operace nasobeni skalarem 
    const typeof(this) opBinaryRight( string op )( T lhs ) const
    if( op == "*" )
    {
        T[dim] ret = data;
        mixin( "ret[] " ~ op ~ "= lhs;" );
        return typeof(this)( ret );
    }
    
    /// Operace porovnani dvou vektoru
    bool opEquals()( auto ref const typeof(this) rhs ) inout
    {
        return data == rhs.data;
    }
    
    /// Operace prirazeni do prvku vektoru
    T opIndexAssign( T rhs, size_t i )
    {
        return data[ i ] = rhs;
    }
    
    /// Operace pricteni a odecteni vektoru
    typeof(this) opOpAssign( string op )( typeof(this) rhs )
    if( op == "+" || op == "-" )
    {
        mixin( "data[] " ~ op ~ "= rhs.data[];" );
        return this;
    }
    
    /// Operace vynasobeni a vydeleni cisla vektorem
    typeof(this) opOpAssign( string op )( T rhs )
    if( op == "*" || op == "/" )
    {
        mixin( "data[] " ~ op ~ "= rhs;" );
        return this;
    }
    
    T opIndex( size_t i ) const
    {
        return data[ i ];
    }
    
    private T[dim] data;
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
        foreach( a, b; lockstep( data[], rhs.data[] ) )
        {
            sum += a * b;
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
            auto lenInv = 1 / length();
            data[] *= lenInv;
        }
    } 
}

alias vec2i = Vector!( int, 2 );
alias vec3i = Vector!( int, 2 );
alias vec4i = Vector!( int, 2 );

alias vec2f = Vector!( float, 2 );
alias vec3f = Vector!( float, 2 );
alias vec4f = Vector!( float, 2 );

alias vec2d = Vector!( double, 2 );
alias vec3d = Vector!( double, 2 );
alias vec4d = Vector!( double, 2 );

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
