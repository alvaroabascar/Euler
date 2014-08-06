#include <stdio.h>

int main()
{
    const int gridSize = 20;
    long paths = 1;

    int i;
    for (i = 0; i < gridSize; i++) {
        paths *= (2 * gridSize) - i;
        paths /= i + 1;
    }
    printf("%li paths\n", paths);
}
