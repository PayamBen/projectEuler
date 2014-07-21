/*
 * =====================================================================================
 *
 *       Filename:  pe59.c++
 *
 *    Description:  XOR decrypted a file encryped with XOR
 *
 *        Version:  1.0
 *        Created:  06/07/13 17:25:47
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Payam Behjat (), 
 *
 * =====================================================================================
 */


#include    <stdlib.h>
#include    <iostream>
#include    <sstream>
#include    <string.h>
#include    <algorithm> 
#include    <stdio.h>
#include    <math.h>
#include    <vector>
using namespace std;

int factorial(int val)
{
    int ret = 1;
   for(int i = 1; i <= val; ++i)
        ret *= i;
    return ret; 
}

void permutate(int f, int l,int k,int* key) 
{
    int a[k];
    int index = 0;
    for(int b = 0; b < k; b++)
    {
        a[b] = f;
    }
    int b= 0 ;
	while (1){
		b = 0;
        for(int n = 0; n < k; n++)
        {
            key[index++] = a[n];
        }
		a[0]++;
		for (b=0;b < k - 1;b++){
			if (a[b] > l) {
				a[b+1]++;
                a[b] = f;
            }
		    else
				break;
		}
		if (a[k - 1] > l)
			return;
	}
}

void permutate2(int f, int l,int k,vector <int> key) 
{
    int a[k];
    int index = 0;
    for(int b = 0; b < k; b++)
    {
        a[b] = f;
    }
    int b= 0 ;
	while (1){
		b = 0;
        for(int n = 0; n < k; n++)
        {
            key[index++] = a[n];
        }
		a[0]++;
		for (b=0;b < k - 1;b++){
			if (a[b] > l) {
				a[b+1]++;
                a[b] = f;
            }
		    else
				break;
		}
		if (a[k - 1] > l)
			return;
	}
}

void reveal(int file[],char key[],int kl,int fl)
{
   int c = 0; char d = 0; 
   string e = "";
    int b;
    for(int y = 0; y < fl; y++)
    {
			if(c == kl) c = 0;
			d = (file[y] ^ key[c]);
			cout << d;
			c += 1;
    }
    cout<< endl;
}


void decrpv1(int f, int l, int k) 
{
    string cfile = "";
    int len = 0;
    char byte = cin.get();
    for (; !cin.eof();byte = cin.get()) 
    {
        cfile += byte;
        if(byte == ',') len++; 
    } 
    cout << cfile << endl;
   int file [len + 1000];
   int x = 0; int temp = 0;
   string s;
   for(int i = 0; i < cfile.length() + 1;i++)
   {
      if(cfile[i] == ',') x++;
      s = cfile.substr(i,1);
      stringstream( s) >> temp;
      file[x] = (file[x] * 10) + temp; 
   }
   char pass[3] = {'g','o','d'};
   reveal(file,pass,3,len + 1);
}

void decrpv2(int f, int l, int k) 
{
    string cfile = "";
   for (char byte; !cin.eof();) 
   {
       byte = cin.get();
       if(byte != ',') cfile += byte; 
   }  
   cout << cfile << endl;

   string t[10] = {"the","be","and","of","a","in","to","have","it","I"}; 
   int sa = (l - f) + 1;
   int combinC = pow(sa,k);
   int key[combinC * k];
   permutate(f,l,k,key);
   cout << "k = " << k << endl;

   int c= 0;
   char d1 [cfile.length()];
   int d = 0;
for(int i = 0; i < combinC; i++)
{
		c = 0;
		for(int y = 0; y < 100; y++)
        {
			if(c == k) c = 0; 
			d = (cfile[y] ^ key[i * k +c]);
			d1[y] = (char) d; 
			c += 1;
        }
        cout << d;
	    int passrate =1; int matches= 0;
        for(int y; y < 100; y++)
        {
			if(d1[y] == 'o' && d1[++y] == 'f')
            {
				matches += 1;
				if(matches >= passrate)
                {
	//				clearText = decode2(e,ct)
					printf ("found key = %s%s%s \n",key[i * k],key[i * k + 1],key[i * k +2]);
	//				printf "Total Ascii value is %d",clearText.map{|x| x[0].ord}.reduce(:+)
	//				return
				}
			}
        }
}
}

void decrpv3(int f, int l, int k) 
{
    string cfile = "";
    int len = 0;
    char byte = cin.get();
    for (; !cin.eof();byte = cin.get()) 
    {
        cfile += byte;
        if(byte == ',') len++; 
    } 
    cout << cfile << endl;
   int file [len + 1000];
   int x = 0; int temp = 0;
   string s;
   for(int i = 0; i < cfile.length() + 1;i++)
   {
      if(cfile[i] == ',') x++;
      s = cfile.substr(i,1);
      stringstream( s) >> temp;
      file[x] = (file[x] * 10) + temp; 
   }

   //string t[10] = {"the","be","and","of","a","in","to","have","it","I"}; 
   int sa = (l - f) + 1;
   int combinC = pow(sa,k);
  // int key[combinC * k]; //work for keys upto k = 4
typedef std::vector<int> int_vector;
int_vector key(combinC * k);
   permutate2(f,l,k,key);
   cout << "k = " << k << endl;

   int c= 0; int b = 0; int matches = 0; int passrate = 15;
   char d1 [cfile.length()];
   char d;
   char theKey[k]; 
for(int i = 0; i < combinC; i++)
{
	matches = 0;	
    //theKey[0] = key[i * k];theKey[1] = key[i * k + 1];theKey[2] = key[i * k + 2];
    for(int n = 0; n < k;n++)
    {
        theKey[n] = key[i * k + n];
    }
    int lettersFound = 0;
    c = 0;
    for(int y = 0; y < len + 1; y++)
    {
			if(c == k) c = 0;
			d = (file[y] ^ theKey[c]);
            if(lettersFound == 0) {
                if(d == ' ')
                    lettersFound++;
            }

            else if(lettersFound == 1) {
                if(d == 't')
                    lettersFound++;
                else 
                    lettersFound = 0;
            }
            else if (lettersFound == 2) {
               if(d == 'h') lettersFound++;
               else lettersFound = 0;
            }
            else if (lettersFound == 3) {
               if(d == 'e') 
                   matches++;
               lettersFound = 0;
            }
            if(y > 150 && matches == 0) break;         
			c += 1;
    }
    if(matches >= passrate)
    {
        printf("Password = %s, matches found = %d\n",theKey,matches);
        reveal(file,theKey,k,len + 1);
        return;
    }
}
}



int main ( int argc, char *argv[] )

{
    decrpv3(97,122,4);

    //permutate(97,122,5);
    return EXIT_SUCCESS;
}				
