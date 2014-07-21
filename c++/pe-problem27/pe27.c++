/*
 * =====================================================================================
 *
 *       Filename:  pe27.c++
 *
 *    Description:  project euler problem 27
 *
 *        Version:  1.0
 *        Created:  03/07/13 00:26:20
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Payam Behjat (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#include <stdio.h>
#include <math.h>
#include <stdlib.h> 

using namespace std;

bool isPrime(int val) {
  val = abs (val);
        if(val == 1) { return false; }
        if(val == 2) { return true; }
        if(val % 2 == 0) { return false; }
        int halfPower = pow(val,0.5);
        int a = 3;
        while (a <= halfPower) {
            if(fmod(val,a) == 0) {
                return false;
            }
           a +=2; 
        } 
        
        return true;
}

void pe27()
{
  int hA = 0; int hB = 0; int count = 0; int max = 0;
  for(int x = -1000; x < 1000; x++) 
  {
    for(int y = -2000;y < 2000; y++)
    {
      count = 0;
      for(int n = 0; n < 81;n++)
      {
	if(isPrime((pow(n,2) + (x * n) + y))) { 
	  count++;
	}
	else { break; }
      }
      if(count > max) 
      {
	max = count; hA = x; hB = y;
      }
//if(count > 10)
//	printf ("found a good set of coefficients x = %d and y = %d result in %d consecutive prime numbers\n",x,y,count);
    }
  }
  printf ("The coefficients for a = %d and b = %d result in %d consecutive prime numbers\n",hA,hB,max);
}
int main ( int argc, char *argv[] ) {
    pe27();
    return 0;
}
