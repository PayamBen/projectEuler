/*
 * =====================================================================================
 *
 *       Filename:  LargePrimeFactor.c++
 *
 *    Description: What is the largest prime factor of the number 600851475143? 
 *
 *        Version:  1.0
 *        Created:  01/07/13 21:48:56
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Payam Behjat (), 
 *   Organization:  
 *
 * =====================================================================================
 */


#include	<iostream>
#include    <math.h>

using namespace std;

bool isPrime(double val) {
        if(val == 1) { return false; }
        if(val == 2) { return true; }
        if(fmod(val,2) == 0) { return false; }
        double halfPower = pow(val,0.5);
        int a = 3;
        while (a <= halfPower) {
            if(fmod(val,a) == 0) {
                return false;
            }
           a +=2; 
        } 
        
        return true;
}
//this version runs in 1.5secs
void pe03() {
double target = 600851475143;
int halfpower = pow(target,0.5);
halfpower = round(halfpower);
for(int n = halfpower; n > 0; n--) {
    if(isPrime(n)) {
        if(fmod(target,n) == 0.0) {
            cout << "Largest Prime factor is " << n << "\n";
            return;
        }
    }
}
}

//This version runs in 65ms
void pe03v2() {
double target = 600851475143;
int halfpower = pow(target,0.5);
halfpower = round(halfpower);
for(int n = halfpower; n > 0; n--) {
    if(fmod(target,n) == 0.0) {
        if(isPrime(n)) {
            cout << "Largest Prime factor is " << n << "\n";
            return;
        }
    }
}
}


int main ( int argc, char *argv[] )

{
    
    pe03v2();
    return 0;
}				
