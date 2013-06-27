module jamc.util.spatialTree;

import std.conv;
debug import std.stdio;

import jamc.util.vector;

/**
 * Strom.
 * T definuje typ ukládaných hodnot.
 * dim definuje počet dimenzí prostoru.
 * maxDepth určuje hloubku stromu a tedy rozsah souřadnic.
 * Platí, že rozsah souřadnic je od 0 do 2 ^ maxDepth - 1 včetně
 */
pure class SpatialTree( T, size_t dimIn, size_t maxDepthIn )
{
    static assert( maxDepth > 0 );
    
    enum dim = dimIn;
    enum maxDepth = maxDepthIn;
    enum size = 2 ^^ maxDepth;
    
    alias Coord = Vector!( uint, dim );
    
    inout( T ) opIndex( Coord coord ) inout
    in
    {
        foreach( c; coord )
        {
            assert( c < size );
        }
    }    
    body
    {
        auto currentNode = &topLevel;
        
        for( size_t i = maxDepth - 1; currentNode.nodes !is null; i-- )
        {
            uint nextNodeIdx = 0;
            foreach( j, e; coord )
            {
                nextNodeIdx |= ( e >>> i & 1 ) << j; // hacky
            }
            
            currentNode = &( currentNode.nodes.nodes[nextNodeIdx] );
        }
        
        return currentNode.payload;
    }
    
    /**
     * Vyplní oblast [c1,c2) daty payload
     */
    void opSliceAssign( in T payload, in Coord c1, in Coord c2 )
    in
    {
        foreach( e; c1 ) assert( e <= size );       
        foreach( e; c2 ) assert( e <= size );
        foreach( i, e; c1 ) assert( e <= c2[i] );
    }
    body
    {
        setNode( topLevel, Coord(), size, c1, c2, payload );
    }
    
private:

    /// Pomocná funkce pro vyplňování prostoru
    void setNode( ref Node node, in Coord nodeCoord, uint nodeSize, in Coord c1, in Coord c2, in T payload )
    {
        bool allIn = true; // Je celý uzel uvnitř vyplňované oblasti?
        bool allOut = false; // Je celý uzel mimo vyplňovanou oblast?
        foreach( i, e; nodeCoord )
        {
            allIn = allIn && e >= c1[i];
            allIn = allIn && e + nodeSize  <= c2[i];
            allOut = allOut || e >= c2[i];
            allOut = allOut || e + nodeSize <= c1[i];
        }
        assert( allIn == false || allOut == false, "Uzel je úplně venku i úplně uvnitř zároveň" );
        assert( !( nodeSize == 1 && allIn == false && allOut == false ), "Uzel o velikosti 1 je částečně uvnitř [" ~ c1.to!string ~ ", " ~ c2.to!string ~ "]");
        
        if( allIn )
        {
            // Pokud je celý uzel uvnitř, tak mu zrušíme poduzly
            node.nodes = null;
            node.payload = payload;
        }
        else if( !allOut )
        {
            if( !node.nodes )
            {
                debug writeln( "Dělím uzel na ", nodeCoord, " na uzly s payloadem ", node.payload );
                node.nodes = new SubNodes;
                foreach( ref subNode; *(node.nodes) )
                {
                    subNode.payload = node.payload;
                }
            }
            
            immutable subNodeSize = nodeSize / 2;
            Coord nodePos;
            
            foreach( nodeIdx, ref subNode; *(node.nodes) )
            {    
                foreach( dimIdx, c; nodeCoord )
                {
                    nodePos[dimIdx] = c + subNodeSize * ( ( nodeIdx >>> dimIdx ) & 1 );
                }
                setNode( subNode, nodePos, subNodeSize, c1, c2, payload );
            }
        }
    }

    struct Node
    {
        T payload;
        SubNodes* nodes;
    }
    
    struct SubNodes
    {
        Node[2^^dim] nodes;
        alias nodes this;
    }

    Node topLevel;

}

unittest
{
    auto tree1 = new SpatialTree!( int, 3, 8 );
    assert( tree1[ vec3ui( 0,0,0 ) ] == int.init );
    assert( tree1[ vec3ui( 31,31,31 ) ] == int.init );
    
    auto tree2 = new const( SpatialTree!( int, 3, 8 ) );
    assert( tree2[ vec3ui( 0,0,0 ) ] == int.init );
    assert( tree2[ vec3ui( 31,31,31 ) ] == int.init );
    
    auto tree3 = new immutable( SpatialTree!( int, 3, 8 ) );
    assert( tree3[ vec3ui( 0,0,0 ) ] == int.init );
    assert( tree3[ vec3ui( 31,31,31 ) ] == int.init );
    
    auto tree4 = new SpatialTree!( int, 2, 2 );
    tree4[ vec2ui( 0, 0 ) .. vec2ui( 4, 4 ) ] = 7;
    foreach( x; 0..3 ) foreach( y; 0..3 ) assert( tree4[ vec2ui( x, y ) ] == 7 );

    tree4[ vec2ui( 0, 0 ) .. vec2ui( 3, 3 ) ] = 15;
    foreach( x; 0..2 ) foreach( y; 0..2 ) assert( tree4[ vec2ui( x, y ) ] == 15 );
    foreach( y; 0..3 ) assert( tree4[ vec2ui( 3, y ) ] == 7 );
    foreach( x; 0..2 ) assert( tree4[ vec2ui( x, 3 ) ] == 7 );
}
