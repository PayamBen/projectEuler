#
# project Euler problem 10 - Circular primes
# Created by Payam Behjat
# Sum of primes less than 2,000,000
#

require 'prime'

def sieveOfErathosthenes(limit)
	a = Array.new(limit, true)
	a[1], a[0] = false, false
	sqLimit = limit ** 0.5
	2.upto(sqLimit) do |x|
		if(a[x]) then
			j = x ** 2
			while(j < limit)
				a[j] = false
				j += x
			end
		end
	end
	#a.each_with_index {|x,index| printf "index = %d = %s\n",index,x}
	a
end	

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
           a += 2 
        end    
        
        return true
end

def test1(limit)
	arr = sieveOfErathosthenes(limit)
	total = 0
	arr.each_with_index do |x, index| 
		if x then total += index end
	end
	total
end

#total2 = 0
#1000.upto(10000) do |x|
#	if(isPrime(x)) then total2 += x end
#end
def test2(limit)
	total = 0
	2.upto(limit) do |x|
		if isPrime(x) then total += x end
	end
	total 
end
printf "total = %d\n", test1(2000000)

