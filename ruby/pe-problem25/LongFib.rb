#
# project Euler problem 24 - Lexicographic permutations
# Created by Payam Behjat
# What is the first term in the Fibonacci sequence to contain 1000 digits?
#

def firstFibOfLength(limit)
	fl, fc = 1,1
	count = 2
	while(fc < limit)
		fl,fc,count = fc,fl+fc,count + 1
	end
	count
end

limit = 10**999
p firstFibOfLength(limit)
