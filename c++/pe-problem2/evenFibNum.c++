/*
 * =====================================================================================
 *
 *       Filename:  evenFibNum.c++
 *
 *    Description:  Sum on Even fibonacci Numbers to a given limit
 *
 *        Version:  1.0
 *        Created:  14/05/13 19:39:37
 *       Compiler:  gcc
 *
 *         Author:  Payam Behjat (), 
 *
 * =====================================================================================
 */


#include	<stdlib.h>
#include	<iostream>
#include    <stdio.h>
#include   <math.h>
using namespace std;


/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  sumEvenFib
 *  Description:  
 * =====================================================================================
 */
double sumEvenFib (int limit )
{
    double newFib = 2;
    double temp = 0;
    double evenSum = 0;
    double lastFib = 1;
    
    for ( ; newFib < limit; ) 
    {
        
        if(fmod (newFib,2) == 0) 
        {
            evenSum += newFib;
        }
        temp = newFib;
        newFib += lastFib;
        lastFib = temp;
        printf("%f--evenSum %f\n",newFib, evenSum);
    }
    return evenSum;
}

int main ( int argc, char *argv[] )

{
    int limit = 4000000;
    cout << "Sum of Even Fibonacci Numbers to " << limit;
    printf (" = %f /n",sumEvenFib(limit));
    return EXIT_SUCCESS;
}				
