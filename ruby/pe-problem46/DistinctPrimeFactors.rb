#
# project Euler problem 47 - Distinct primes factors
# Created by Payam Behjat
# Find the first four consecutive integers to have four distinct prime 
# factors. What is the first of these numbers?
#

require 'prime'


def pe46(count)
	found = 0
	1.upto(1000000) do |x|
		arr = x.prime_division
		if (arr.length == count) then 
			found += 1
		else
			found = 0
			next
		end
		if(found == count) then 
			printf "found answer %d\n",x - count + 1 
			return
		end
	end
end

pe46(4)
 
