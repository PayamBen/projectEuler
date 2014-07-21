#
# project Euler problem 48 - Self Power
# Created by Payam Behjat
# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.
#

def pe48(limit)
	total = 0
	1.upto(limit) do |x|
		total +=  x ** x
	end
	printf "The sum of the self powers up to %d is %d", limit, total
end

pe48(1000)
