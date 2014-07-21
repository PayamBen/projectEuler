#
# project Euler problem 34 - Digit fractorials
# Created by Payam Behjat
# Find the sum of all numbers which are equal to the sum of the 
# factorial of their digits.
#

def splitNumber(val)
	resArr = []
	while(val >= 1)
		resArr.push(val % 10)
		val = val / 10
	end
	resArr
end

def factorial(val)
	result = 1
	1.upto(val) do |x|
		result = result * x
	end
	result
end

# working with the limit of 2,500,000
def df1()
	dig = []
	sum = 0;
	145.upto(260000) do |x|
		dig = splitNumber(x)
		temp = dig.map {|d| factorial(d)}.reduce(:+)
		#p temp
		if(x == temp ) then
			printf "x = %d\n",x
			sum = sum + x
			next
		end
		if(x > temp - 5 and x < temp + 5) then
			printf "close but not x = %d\n",x
		end
	end
	sum
end

#printf "fact %d\n", factorial(9)
printf "The sum of the digFactorials is %d",df1
