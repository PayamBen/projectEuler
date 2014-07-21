/*
 * =====================================================================================
 *
 *       Filename:  pe32.c++
 *
 *    Description:  project euler problem 32
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


#include    <math.h>
#include	<iostream>
#include    <stdio.h>
#include    <list>
#include    <set>
#include    <unistd.h> //to allow the program to sleep
#include    <array>
using namespace std;

void splitNumber(list<int>& digits, int number) {
  if (0 == number) { 
    digits.push_back(0);
  } else {
    while (number != 0) {
      int last = number % 10;
      digits.push_front(last);
      number = (number - last) / 10;
    }
  }

}
 
void pe32() {
    /* Normally arrays have limitations for opt to use std::Array */
   //int checkCard[] = {1,1,1,1,1,1,1,1,1,1};
   //int test[] = {1,0,0,0,0,0,0,0,0,0};
    set <int> ans;
    set <int>::iterator it;
    array <int, 10> checkCard{1,1,1,1,1,1,1,1,1,1};
    array <int, 10> test{1,0,0,0,0,0,0,0,0,0};
    int b = 0;
    int sum = 0;
    for(int c = 1234; c < 9876; c++) {
        for(int a = 1; a < pow(c,0.5);a++) {
            b = c / a;
            if (c % b != 0) {continue;}
           list<int> da, db, dc;
           splitNumber(da,a);
           splitNumber(db,b);
           splitNumber(dc,c);
           da.merge(db);
           da.merge(dc);
           for (std::list<int>::iterator it = da.begin(); it != da.end(); it++) {
                checkCard[*it] -= 1;
                //usleep(5000);
           }
           if (checkCard == test) {
               //printf ("a = %d, b = %d, c = %d\n",a,b,c);
               ans.insert(c);
                
           }
           for(int i = 0; i < 11; i++) { checkCard[i] = 1;}
        }
    }
    for (it=ans.begin(); it!=ans.end(); ++it)
        sum += *it;
	printf ("The sum = %d\n",sum);
}


int main ( int argc, char *argv[] ) {
    pe32();
    return 0;
}				


