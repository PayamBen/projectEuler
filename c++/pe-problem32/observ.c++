#include <iostream>
#include <iomanip>
#include <deque>
#include <set>
#include <algorithm>

int main ()
{
    std::deque<int> permutation (9);
    const int init[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    std::set<int> products;

    permutation.assign (init, init + sizeof (init) / sizeof (init [0]));

    for (int i = 0; i < 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2; ++i)
    {
        std::next_permutation (permutation.begin(), permutation.end());
        int product1 = permutation [8];
        int product2 = permutation [7] * 10 + product1;
        int product3 = permutation [6] * 100 + product2;
        int product4 = permutation [5] * 1000 + product3;
        int a1 = permutation [0];
        int a2 = a1 * 10 + permutation [1];
        int a3 = a2 * 10 + permutation [2];
        int a4 = a3 * 10 + permutation [3];
        int b1 = permutation [4];
        int b2 = permutation [3] * 10 + b1;

        if (a3 * b2 == product4)
            products.insert (product4);

        if (a4 * b1 == product4)
            products.insert (product4);
    }
    int acc = 0;
    for (std::set<int>::iterator i = products.begin(); i != products.end(); ++i)
        acc += *i;
    std::cout << "total: " << acc << std::endl;
    return 0;
}
