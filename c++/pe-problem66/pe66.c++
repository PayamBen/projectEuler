/*
 * =====================================================================================
 *
 *       Filename:  pe66.c++
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  11/07/13 15:33:11
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Payam Behjat (), 
 *   Organization:  
 *
 * =====================================================================================
 */



#include	<stdlib.h>
#include	<iostream>
#include    <math.h>
#include    <stdio.h>
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


int minSolution(int d) 
{
	double sx = 1.0;
	double oddx = 3.0;
    double sy = 1.0; double oddy = 3.0;
	for(int x = 1; x < 2500000; x++) 
    {
		sy = 1; 
        oddy = 3;
		sx += oddx;
		oddx += 2;
        //l = ceil(x / d) + 50;
        //cout << l << endl;
		for(int y = 1; y < x; y++)
        {
            sy += oddy; 
            oddy += 2;	
			if(sx - (d * sy) != 1) continue;
			return x;
		}
    }
	return 90000009;
}

int minSolutionv3(int d) 
{
	double sx = 1.0;
	int oddx = 3;
    double sy = 1.0; int oddy = 3; int l = 0;
	for(int x = 1; x < 2500000; x++) 
    {
		sy = 1; 
        oddy = 3;
		for(int y = 1; y < x; y++)
        {
			if(sx - (d * sy) == 1)
            {
			    cout << "y = " <<  y << " ";
                return x;
            }
            sy += oddy; 
            oddy += 2;
 
		}
        sx += oddx;
        oddx += 2;

    }
	return -1;
}

int minSolutionv4(int d) 
{
	double sx = 40000000000;  
	int oddx = 3;
    double sy = 1.0; int oddy = 3; int l = 0;
	for(int x = 200000; x < 210000; x++) 
    {
		sy = 1; 
        oddy = 3;
		for(int y = x / 10; y < x / 2.5; y++)
        {
			if(sx - (d * sy) == 1)
            {
			    cout << "y = " <<  y << " ";
                return x;
            }
            sy += oddy; 
            oddy += 2;
 
		}
        sx += oddx;
        oddx += 2;

    }
	return -1;
}

int minSolutionv2(int d) 
{
	int sx = 1;
	int oddx = 3;
    int sy = 1; int oddy = 3; double l = 0;
	for(int x = 1; x < 250000; x++) 
    {
       sx = pow(x,2);
       l = sx / d + 10;
		for(int y = 1; y < l; y++)
        {
            sy = pow(y,2);
			if(sx - (d * sy) != 1) continue;
			return x;
		}
    }
	return 90000009;
}


void pe66v2()
{    
   int da[781];
   int index = 0;
	for(int i = 59; i< 1000; i++)
    {
		if(fmod(pow(i,0.5), 1) == 0) continue;
        //if(!isPrime(i)) continue;
		da[index] = i;
        index++;
    }
	
	int max = 0; int x = 0;
    int d = 0;int maxD = 0;
    for(int i = 0; i < 781; i++)
    {
	    d = da[i];
		x = minSolution(d);
		printf("d = %d with x = %d\n",d,x);
		if(x > max)
        {
			max = x;
			maxD = d;
        }
    }
	printf("Found x = %d from %d\n",max,maxD);
}


void pe66() 
{
   int da[970];
   da[0] = 2;
   int index = 1;
	for(int i = 19; i< 1000; i++)
    {
		if(fmod(pow(i,0.5), 1) == 0) continue;
		da[index] = i;
        index++;
    }
	
	int max = 0;
	
	for(int i = 0; i < 970; i++)
    {
		int sx = 1;int sy = 0;
		int oddx = 3;
		int oddy = 3;
        cout << " d = " << da[i] << endl;
		for(int x = 1; x < 100000; x++)
        {
			sy = 1;
            oddy = 1;
			sx += oddx;
			oddx += 2;
			for(int y = 1; y < sx / da[i]; y++)
            {
                sy += oddy;
				oddy += 2;
				if(sx - (da[i] * sy) != 1) continue;
				if(x > max)
                {
					max = x;
					printf ("Found x = %d y = %d d = %d\n",x,y,da[i]);
                }
            }
        }
    }

}

int main ( int argc, char *argv[] )

{
    pe66v2();
    return EXIT_SUCCESS;
}				

