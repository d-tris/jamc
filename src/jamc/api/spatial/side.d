module jamc.api.spatial.side;

/**
 * Reprezentuje stranu bloku
 *    ___________
 *   /          /|                     _
 *  /   top    / |                     /| severní strana světa
 * /__________/  |                    /
 * |          |we|   východní <------/------> západní
 * |          |st|                  /
 * |  south   | /                 |/_  jižní
 * |          |/
 * |__________|
 * 
 */
enum Side
{
    top,
    bottom,
    north,
    south,
    west,
    east
}
