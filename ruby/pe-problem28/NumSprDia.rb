#
# project Euler problem 28 - Number spiral diagonals
# Created by Payam Behjat
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
# What is the sum of the numbers on the diagonals in a 1001 by 1001 
# spiral formed in the same way?
#

nw, ne, se, sw = 28,34, 16, 21
#(1001-5) / 2 = 498
1.upto(498) { |x|
	gS = (x * 2) + 5
	nw = nw + ((gS ** 2) - (gS - 1)) 
	ne = ne + gS ** 2
	se = se + ((gS - 2) ** 2) + ((2 * gS) - 2)
	sw = sw + (gS - 2) ** 2 + (gS - 1)
	printf "gridsSize = %d, ne= %d, se = %d, sw = %d, nw = %d\n",gS , ne, se, sw, nw
	
}
printf "The total of the Diagonals  = %d\n", nw + ne + se + sw + 2


