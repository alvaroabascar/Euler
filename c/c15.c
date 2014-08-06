#include <stdio.h>
#include <stdlib.h>

/* Lattice Paths
*
* Starting in the top left corner of a 2×2 grid, and only being able to
* move to the right and down, there are exactly 6 routes to the bottom 
* right corner.
*
* How many such routes are there through a 20x20 grid?
*/

long long latpaths(int h, int w, int x, int y);

int main(int argc, char *argv[])
{
    int n = atoi(argv[1]);
    int m = (argc > 2) ? atoi(argv[2]) : n;
    printf("%lli\n", latpaths(n, m, 0, 0));
}

/* latpaths:
* given the dimensions of the grid (h by w) and the starting position
* (x, y), returns the number of routes to get to the bottom right corner
* (0, 0) is the upper left corner, and (w, h) is the bottom right corner
*/
long long latpaths(int h, int w, int x, int y)
{
    long long register rpaths, dpaths, nextrpaths, nextdpaths; /* number of possible steps */
    if (y == h && x == w)
        return 0; /* we are at bottom right corner */
    if (x < w) {
        nextrpaths = latpaths(h, w, x+1, y);
        rpaths = (nextrpaths > 0) ? nextrpaths : 1;
    }
    if (y < h) {
        nextdpaths = latpaths(h, w, x, y+1);
        dpaths = (nextdpaths > 0) ? nextdpaths : 1;
    }
    return dpaths + rpaths;
}


