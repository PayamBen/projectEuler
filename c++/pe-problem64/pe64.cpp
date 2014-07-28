#include <iostream>
#include  <cmath>
#include <vector>

using namespace std;

/**
 *Find the continual fraction of val square root
 **/
int conFraction(int val)
{
    int base[15], x[15];
    int temp, count = 0;
    x[0] = val;
    base[0] = floor(sqrt(val));
    
    for(int i = 1; i < 2; i++)
    {
        
        temp = val - (base[i] * base[i]);
        base[i] = floor(sqrt(val));
        cout << "base " << base[i] << " temp = " << temp << endl;
        //x[i] = 
        
    }
    
    return count;
    //remain[0] = val % base[0];
    //cout << "base = "<< base[0] << "   remain = " << remain[0] <<endl;
    
}

std::vector<unsigned long> sqrtCF(unsigned long D) {
    // sqrt(D) may be slightly off for large D.
    // If large D are expected, a correction for R is needed.
    unsigned long R = floor(sqrt(D));
    std::vector<unsigned long> f;
    f.push_back(R);
    if (R*R == D) {
        // Oops, a square
        return f;
    }
    unsigned long a = R, P = 0, Q = 1;
    do {
        P = a*Q - P;
        Q = (D - P*P)/Q;
        a = (R + P)/Q;
        f.push_back(a);
    }while(Q != 1);
    return f;
}

int main()
{
    int count = 0;
    std::vector <unsigned long> answer;
    //answer = sqrtCF(11);
    for(int i = 2; i <= 10000; i++)
    {
        unsigned long check = floor(sqrt(i));
        if(check * check == i )
            continue;
        answer = sqrtCF(i);
        if (answer.size() % 2 == 0)
        {
            //odd period
            count++;
        }
    }
    cout << "The total odd periods is " << count << endl;
}

