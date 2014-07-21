#
# project Euler problem 27 - Quadratic primes
# Created by Payam Behjat
# n² + an + b
#

def isPrime(val)
	val = val.abs
	if(val == 1 or val == 0) then return false end
	if(val == 2) then return true end
	if(val % 2 == 0) then return false end
	halfPower = val ** 0.5
	a = 3
	while a <= halfPower
		if(val % a == 0)
			return false
		end
	   a +=2 
	end    
	
	return true
end

hA, hB,count1,max = 0, 0, 0, 0
(-1000..1000).each do |a|
	(-2000 ..2000).each do |b|
		count1 = 0
		0.upto(80) do |n|
			if(isPrime((n ** 2) + (a * n) + b)) then
				count1 = count1 + 1
			else
				break
			end
		end
		if (count1 > max) then
			max,hA,hB = count1,a,b
		end
		#if (count1 > 10) then
		#	printf "found a good set of coefficients a = %d and b = %d result in %d consecutive prime numbers\n",a,b,count1
		#end
	end
end

printf "The coefficients for a = %d and b = %d result in %d consecutive prime numbers\n",hA,hB,max

