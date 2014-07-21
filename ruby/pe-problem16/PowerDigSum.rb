#  PowerDigSum.rb
#  
#  Created By Payam Behjat
#  
#  What is the sum of the digits of the number 2**1000?


def sumofDigits(bigVal)
	sum = 0
	while bigVal > 0 
		digit = bigVal % 10
		bigVal /= 10
		sum += digit
	end
	sum
end


$target = 2**1000
puts sumofDigits($target)



