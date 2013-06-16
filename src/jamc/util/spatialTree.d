module jamc.util.spatialTree;

import jamc.util.vector;

/**
 * Strom.
 * T definuje typ ukládaných hodnot.
 * dim definuje počet dimenzí prostoru.
 * maxDepth určuje hloubku stromu a tedy rozsah souřadnic.
 * Platí, že rozsah souřadnic je od 0 do 2 ^ maxDepth - 1 včetně
 */
class SpatialTree( T, size_t dim, size_t maxDepth )
{
    static assert( maxDepth > 0 );
    
    T opIndex( Vector!( uint, dim ) coord )
    in
    {
        foreach( c; coord )
        {
            assert( c < size );
        }
    }    
    body
    {
        Node* currentNode = &topLevel;
        
        for( size_t i = maxDepth - 1; currentNode.nodes !is null; i-- )
        {
            uint nextNodeIdx = 0;
            foreach( j, e; coord )
            {
                nextNodeIdx |= ( e >>> i & 1 ) << j; // hacky
            }
            
            currentNode = &( (*currentNode.nodes)[nextNodeIdx] );
        }
        
        return currentNode.data;
    }
    
    private:

    struct Node
    {
        T data;
        Node[8]* nodes;
    }

    enum size = 2 ^^ maxDepth;

    Node topLevel;

}

unittest
{
    auto tree = new SpatialTree!( int, 3, 5 );
    assert( tree[ vec3ui( 0,0,0 ) ] == int.init );
    assert( tree[ vec3ui( 31,31,31 ) ] == int.init );
}
