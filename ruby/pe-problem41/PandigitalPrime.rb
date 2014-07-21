# Pandigital prime
#  
# What is the largest n-digit pandigital prime that exists?
# The primes.txt file is stored in the document folder

require 'prime'

def splitNumber(val)
	resArr = []
	x = 0
	while(val >= 1)
		x = val % 10
		resArr.push(x)
		val = val / 10
	end
	resArr.reverse
end

def sieveOfErathosthenes(limit)
	a = Array.new(limit, true) 
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

def isPrime2(val)
        if(val == 1) then return false end
        if(val == 2) then return true end
        #if(val % 2 == 0) then return false end
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

def isPanDigit(val)
	checkCard = [1,1,1,1,1,1,1,1,1,1]
	val.each do |x|
		checkCard[x] = checkCard[x] - 1
	end
	if(checkCard == [1,0,0,0,0,0,0,0,0,0]) then  return true end
	return false
end

def isPanDigitAnyLength(val)
	checkCard = Array.new(val.size, 1)
	checkcard2 = Array.new(val.size, 0)
	#checkcard2[0] = 1
	val.each do |x|
		if(x > val.size or x == 0) then return false end
		checkCard[x - 1] = checkCard[x - 1] - 1
	end
	if(checkCard == checkcard2) then  return true end
	return false
end

def panPrime1()
	primes = []
	p "loading primes"
	primes = sieveOfErathosthenes(100000000)
	p "calculating"
	978654321.downto(123456789) do |x|
		if(isPanDigit(splitNumber(x))) then
			if (primes.includes?(x)) then print x; break end
		end
		if(x % 100000 == 0) then p x end
	end
end
def panPrime2()
	x = 497658321
	while(true)
		numbers = splitNumber(x)
		#if(x % 3121 == 0) then p x end
		#if (numbers.include?(0)) then next end
		if(isPanDigit(numbers)) then 
			if (isPrime2(x)) then printf"The answer is %d", x; break end
			#else printf "x %d is not prime\n", x end
		end
		x -= 2
	end
end

# need more testing
def better_sieve_upto(n)
  s = (0..n).to_a
  s[0] = s[1] = nil
  s.each do |p|
    next unless p
    break if p * p > n
    (p*p).step(n, p) { |m| s[m] = nil }
  end
  s.compact
end

# read from primes.txt which was generated by my java program.
arr = File.open("primes.txt").read.split("\n")
arr = arr[200..10000000]
p arr[100..200]
positionCheck = 10000000#arr.length - 1
lastStatus = positionCheck
nextprime = 0
while(true)
	nextPrime = splitNumber(arr.pop.to_i)
	#p arr.pop.to_i
	if (isPanDigitAnyLength(nextPrime)) then printf "Found it %s\n", nextPrime ; break end
	positionCheck -= 1
	if(positionCheck < lastStatus - 100000) then 
		printf "position %d ", positionCheck
		lastStatus = positionCheck
	end
	
end
#p isPanDigit([1,2,3,4,5,6,7,8,9])
#p isPanDigitAnyLength([1,2,5,7,3,4,6])