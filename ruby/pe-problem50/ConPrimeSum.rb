#
# project Euler problem 50 - Consecutive prime sum
# Created by Payam Behjat
# Which prime, below one-million, can be written as the sum of the 
# most consecutive primes?  
#

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
	a[0], a[1] = false, false
	a
end	

#works for upto 100
def pe50()
	a = sieveOfErathosthenes(100)
	prim = {}
	a.each_with_index do |x, index|
		if x then prim[index] = 1 end
	end
	someSolutions = {}
	hash, total, count = {}, 0, 0
	prim.each_pair do |k, v|
		count += 1
		total += k
		if(prim.has_key?(total))
			someSolutions[total] = count
		end
	end
	p someSolutions
	p someSolutions.to_a.map {|k,v| v}.flatten.max
end

require 'prime'

# the problem needs improving
def pe50v2()
	a = sieveOfErathosthenes(3990)
	prim,total,count = [], 0, 0
	a.each_with_index do |x, index|
		if x 
			total += index
			count += 1 
			prim.push([total,count])
		end
	end
	#p prim
	max = 0
	thePrime = 0
	seq = prim.map {|k| k }.permutation(2).to_a.each {|x| x.flatten!}
	seq.each do |a, b, c , d| 
		#printf "%d %d %d %d\n", a, b, c, d
		e = a - c
		if(Prime.prime?(e)) then
			if(max < b - d) then
				max = b - d
				thePrime = e
				printf "prime %d with max %d\n",e,max
			end
		end
	end
	printf "the prime is %d with a seqence of %d\n",thePrime, max
end

require 'prime'

def germ()
	primes = Prime.first 1000
	primes.length.downto(1) do |len|
	  0.upto(primes.length-len) do |pos|
		sum = primes[pos, len].reduce(:+)
		break if sum >= 1000000
		if sum.prime?
		  p sum
		  exit
		end
	  end
	end
end

def myGerm()
	primes = Prime.first 1000
	p primes.length
	primes.length.downto(1) do |len|
	  0.upto(primes.length-len) do |pos|
		sum = primes[pos, len].reduce(:+)
		break if sum >= 1000000
		if sum.prime?
		  p sum
		  exit
		end
	  end
	end
end

#pe50v2()
myGerm()
