#include <iostream>
#include <algorithm>
#include <set>
using namespace std;

int main() {
   int narr[] = {1,2,3,4,5,6,7,8,9};
   set<int> prods;
   int rhs;

   do {
      rhs = 1000*narr[5] + 100*narr[6] + 10*narr[7] + narr[8];

      if (narr[0] * (1000*narr[1] + 100*narr[2] + 10*narr[3] + narr[4]) == rhs
      || (10*narr[0] + narr[1]) * (100*narr[2] + 10*narr[3] + narr[4]) == rhs) {
         prods.insert(rhs);
      }
   } while (next_permutation(narr, narr+9));

   int total = 0;
   set<int>::iterator it;

   for (it = prods.begin(); it != prods.end(); ++it) { total += *it; }

   cout << total << endl;

   return 0;
}
