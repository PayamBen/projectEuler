/*
 * =====================================================================================
 *
 *       Filename:  pe96.c++
 *
 *    Description: By solving all fifty puzzles find the sum of the 3-digit numbers found in the top left corner of each solution grid; for example, 483 
 *    is the 3-digit number found in the top left corner of the solution grid above. 
 *
 *        Version:  1.0
 *        Created:  04/07/13 17:30:09
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Payam Behjat (), 
 *
 * =====================================================================================
 */


#include	<stdlib.h>
#include	<iostream>
#include    <string>
#include    <stdio.h>
#include    <math.h>

using namespace std;


    /*
     * is the value legal in the given position
     * position values for 9x9 are 0 - 80,
     * value is between 1 - 9
     */

void printGrid(int grid []) 
{
    printf("\n**************Puzzel Start***************\n");
    for(int a = 0; a < 9;a++){
            //printf ("%d,%d,%d,%d,%d,%d,%d,%d,%d\n",grid[++a],grid[++a],grid[++a],grid[++a],grid[++a],grid[++a],grid[++a],grid[++a],grid[++a]);
            for(int b = 0;b < 9; b++) 
            {
                cout << grid[(a * 9) + b] << ",";
            }
            cout << "\n";
            if(a == 27 || a == 54) {
                printf("-----------------\n");
            }
    }
    printf("\n**************Puzzel End*****************\n");
}

    bool isLegal(int grid[], int position, int value) {
        //find row number
        //System.out.print("\n position = " + position + " values = " + value);
        int puzzelSize = 81;
        int gridSize = 9;
        
        int rowNumber = floor(position/gridSize);
        
        //search row
        int startRow = rowNumber * gridSize;
        for(int a = startRow; a < startRow + 9; a++) {
            if (value == grid[a]) {
                return false;
            }
        }
        
        //search column
        int startCol = position - (rowNumber * 9);
        for(int a = startCol; a < puzzelSize; a += 9) {
            if(value == grid[a]) {
                return false;
            }
        }
        
        //search remaining boxes in square
        startRow = (int) floor( rowNumber / 3);
        startCol = (int) floor( startCol/ 3);
        int startSquare = (startRow * 27) + (startCol * 3);
        for(int a = startSquare; a < startSquare + 21 ; a +=9) {
            for(int b = 0; b < 3; b++) {
                if(value == grid[a + b]) {
                    return false;
                }
            }
        }
        return true;
    }

 void solve(int grid[], int position)
   {
      // Throw an exception to stop the process if the puzzle is solved
      if( position > 80 ) {
         //printf( "Solution found" ) ;
         //printGrid(grid);
         cout << grid[0] << grid[1] << grid[2] << " ";
         return;
      }
      // If the cell is not empty, continue with the next cell
      if( grid[position] != 0 )
         solve(grid,position + 1) ;
      else
      {
         // Find a valid number for the empty cell
         for( int num = 1; num < 10; num++ )
         {
            if( isLegal(grid, position, num))
            {
               grid[position] = num;
               //printf ("position = %d = %d\n",position,num);

               // Delegate work on the next cell to a recursive call
               solve(grid,position + 1);
            }
         }
         // No valid number was found, clean up and return to caller
         grid[position ] = 0;
      }
   }

void pe96() 
{
   string ref = "";
    int a = 0;
    int count = 0;
    int grid [81] ; grid[0] = -1;
    
   for (string line; getline(cin, line);) {
        if(line.length() < 9) 
        {
            ref = line; 
            a = 0; 
            if(grid[0] != -1)
            {
                solve(grid,0);
            }
            continue;
        }
        for(int b = 0; b < 9; b++,a++)
        {
            grid[a] = line[b] - 48; //convert to int
        }
    } 
    
   //printGrid(grid);
   solve(grid,0);
   //printf ("counted %d solutions\n",count);
 
}


int main ( int argc, char *argv[] )

{
    
    pe96();
    return EXIT_SUCCESS;
}				
