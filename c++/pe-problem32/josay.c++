#include <stdio.h>

int main (int argc, char ** argv)
{
    int i;
    long long int a,b,c;
    int tab[9];
    for ( tab[0]=1 ; tab[0]<10 ; tab[0]++)
    for ( tab[1]=1 ; tab[1]<10 ; tab[1]++)
        if (tab[1]!=tab[0])
    for ( tab[2]=1 ; tab[2]<10 ; tab[2]++)
        if (tab[2]!=tab[0] && tab[2]!=tab[1])
    for ( tab[3]=1 ; tab[3]<10 ; tab[3]++)
        if (tab[3]!=tab[0] && tab[3]!=tab[1] && tab[3]!=tab[2])
    for ( tab[4]=1 ; tab[4]<10 ; tab[4]++)
        if (tab[4]!=tab[0] && tab[4]!=tab[1] && tab[4]!=tab[2] && tab[4]!=tab[3])
    for ( tab[5]=1 ; tab[5]<10 ; tab[5]++)
        if (tab[5]!=tab[0] && tab[5]!=tab[1] && tab[5]!=tab[2] && tab[5]!=tab[3] && tab[5]!=tab[4])
    for ( tab[6]=1 ; tab[6]<10 ; tab[6]++)
        if (tab[6]!=tab[0] && tab[6]!=tab[1] && tab[6]!=tab[2] && tab[6]!=tab[3] && tab[6]!=tab[4] && tab[6]!=tab[5])
    for ( tab[7]=1 ; tab[7]<10 ; tab[7]++)
        if (tab[7]!=tab[0] && tab[7]!=tab[1] && tab[7]!=tab[2] && tab[7]!=tab[3] && tab[7]!=tab[4] && tab[7]!=tab[5] && tab[7]!=tab[6])
    for ( tab[8]=1 ; tab[8]<10 ; tab[8]++)
        if (tab[8]!=tab[0] && tab[8]!=tab[1] && tab[8]!=tab[2] && tab[8]!=tab[3] && tab[8]!=tab[4] && tab[8]!=tab[5] && tab[8]!=tab[6] && tab[8]!=tab[7])
    {
        // aa * bbb = cccc
        a=0;b=0;c=0;
        for ( i=0 ; i<9 ; i++)
            if (i<2)
                a=10*a+tab[i];
            else if (i<5)
                b=10*b+tab[i];
            else
                c=10*c+tab[i];
        if (a*b==c)
            printf("%lld = %lld * %lld\n",c,a,b);

        // a * bbbb = cccc
        a=0;b=0;c=0;
        for ( i=0 ; i<9 ; i++)
            if (i<1)
                a=10*a+tab[i];
            else if (i<5)
                b=10*b+tab[i];
            else
                c=10*c+tab[i];
        if (a*b==c)
            printf("%lld = %lld * %lld\n",c,a,b);

   }
   return 0;
}
