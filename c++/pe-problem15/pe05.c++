/*
 * =====================================================================================
 *
 *       Filename:  pe05.c++
 *
 *    Description:  pe problem 15
 *
 *        Version:  1.0
 *        Created:  03/07/13 00:01:55
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Payam Behjat (), 
 *
 * =====================================================================================
 */


#include	<stdlib.h>
#include	<iostream>
using namespace std;

void pe05(int lcount) {
    double grid [lcount + 1][lcount + 1]; 
   for(int a= 0; a < lcount + 1; a++) {
        for(int b = 0; b < lcount + 1; b++) {
            grid[a][b] = 1.0;
        }
    }
    for(int a= 1; a < lcount + 1; a++) {
        for(int b = 1; b < lcount + 1; b++) {
            grid[a][b] = grid[a-1][b] + grid[a][b -1];
        }
    }
    cout << "Lattice path count = " << grid[lcount][lcount];
}

int main ( int argc, char *argv[] )

{
    pe05(200);
    return 0;
}				
