/*
 * =====================================================================================
 *
 *       Filename:  pe60.c++
 *
 *    Description: Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime. 
 *
 *        Version:  1.0
 *        Created:  06/07/13 11:26:22
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Payam Behjat (), 
 *   Organization:  
 *
 * =====================================================================================
 */



#include  <stdlib.h>
#include  <iostream>
#include  <cmath>
#include  <stdio.h>
using namespace std;

int nlength(int n)
{
  int c = 0;
  while(n >= 1) 
  {
    n /= 10;
    c += 1;
  }
  return c;
}

void sieveOfArkins(bool sieve[], int limit)
{
 int root = ceil(sqrt(limit));
 //int primeSize = 10000000; 
 //int primes[primeSize];
 int insert = 2;
  for (int z = 0; z < limit; z++) sieve[z] = false; //Not all compilers have false as the default boolean value
    for (int x = 1; x <= root; x++)
    {
        for (int y = 1; y <= root; y++)
        {
        //Main part of Sieve of Atkin
        int n = (4*x*x)+(y*y);
        if (n <= limit && (n % 12 == 1 || n % 12 == 5)) sieve[n] ^= true;
        n = (3*x*x)+(y*y);
        if (n <= limit && n % 12 == 7) sieve[n] ^= true;
        n = (3*x*x)-(y*y);
        if (x > y && n <= limit && n % 12 == 11) sieve[n] ^= true;
        }
    }
 
 //Mark all multiples of squares as non-prime
 for (int r = 5; r <= root; r++) if (sieve[r]) for (int i = r*r; i < limit; i += r*r) sieve[i] = false;
 sieve[2] = true; sieve[3] = true;
}

void pe60() 
{
    int limit = 1000;
    bool sieve[limit];
    sieveOfArkins(sieve,limit);
    int count = 0;
    for (int a = 2; a < limit; a++)
    {
        if (sieve[a]) count++;
    }
    int primes[count]; int insert = 0;    
    for (int a = 2; a < limit; a++)
    {
        if (sieve[a])
        {
            primes[insert] = a;
            insert++;
        }
    }
    //cout << primes[count - 1] << endl;
    //printf("There are %d prime number below %d\n",count,limit);
    //cout << nlength(1234567);
}

int main ( int argc, char *argv[] )

{
    pe60();
    return EXIT_SUCCESS;
}				

