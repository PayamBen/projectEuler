#  Truncatable primes
#  
# Find the sum of the only eleven primes that are both truncatable from 
# left to right and right to left.
#  

def isPrime(val)
	if(val == 1) then return false end
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

# requires a string
def isTruncatablePrime(val)
	ln = val.length
	part = nil
	#arr = val.split('')
	0.upto(ln - 2) do |x|
		part = val[0..x]
		if (!isPrime(part.to_i)) then return false end
	end
	(ln - 1).downto(1) do |x|
		part = val[x..-1]
		if (!isPrime(part.to_i)) then return false end
	end
	return true
end

x, score, sum = 11,0, 0
while(score < 11) do
	if(isPrime(x)) then
		if(isTruncatablePrime(x.to_s)) then 
			score = score + 1
			sum = sum + x
			p x
		end
	end
	x = x + 1
end

printf "The sum is %d\n", sum
