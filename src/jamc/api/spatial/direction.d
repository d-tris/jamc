module jamc.api.spatial.direction;

public import jamc.api.spatial.side;

/**
 * Reprezentuje směr v rámci bloku, tj. mezi dvěma stěnami
 */
struct Direction
{
    Side src;
    Side dst;
    
    enum
    {
        up      = Direction( Side.bottom, Side.top ), /// Nahoru, tj. od spodní strany k horní
        down    = Direction( Side.top, Side.bottom ), /// Dolů, tj. od horní strany ke spodní
        north   = Direction( Side.south, Side.north ), /// Na sever, tj. od jižní strany k severní
        south   = Direction( Side.north, Side.south ), /// Na jih, tj. od severní strany k jižní
        west    = Direction( Side.east, Side.west ), /// Na západ, tj. od východní strany k západní
        east    = Direction( Side.west, Side.east ), /// Na východ, tj. od západní strany k východní
    }
}
