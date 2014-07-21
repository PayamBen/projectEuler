/*
 * =====================================================================================
 *
 *       Filename:  pe5.c++
 *
 *    Description: What is the smallest positive number that is evenly divisible 
 *                  by all of the numbers from 1 to 20? 
 *
 *        Version:  1.0
 *        Created:  02/07/13 09:01:39
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Payam Behjat (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#include    <stdio.h>    
#include	<iostream>
using namespace std;

int howDivisible(int val) {
	for(int i = 2; i < 22; i++) {
		if(val % i != 0) {return i - 1;}
    }
	 
	return 21;
}

void pe05() {
    int a = 200000000;
    int temp = 0;
    while (true) {
	    temp = howDivisible(a);
        //cout << "temp = " << temp << "\n";
	    if(temp > 15) {
		    printf ("mega Divisible is = %d with %d\n", a, temp);
		    if(temp >= 20) {
			    return;
            }
        }
	    a++;
    }
}

int main ( int argc, char *argv[] )

{
    pe05();    
    return 0;
}				


