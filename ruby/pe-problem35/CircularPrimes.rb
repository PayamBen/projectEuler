#
# project Euler problem 35 - Circular primes
# Created by Payam Behjat
# How many circular primes are there below one million?
#

def splitNumberifOdd(val)
	resArr = []
	x = 0
	while(val >= 1)
		x = val % 10
		if(x % 2 == 0)
			return false
		end
		resArr.push(x)
		val = val / 10
	end
	resArr
end

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


# Function chceks if all permutation NOT ROTATIONS are prime numbers
def cp1
	numPerm = []
	permPrime = true
	total = 0;
	100.upto(200) do |x|
		#if (x % 1000 == 0) then p x end
		if(isPrime(x) == false) then next end
		numPer = splitNumberifOdd(x)
		if(numPer == false) then next end
		numPer = numPer.permutation().to_a
		numPer = numPer.map {|y| y.join.to_i}
		permPrime = true
		numPer.each do |perm|
			#printf "checking %s \n", perm
			if(isPrime(perm) == false) then permPrime = false; printf "x %d- failed %d \n",x, perm; break end
		end
		#p permPrime
		if (permPrime == true) then total = total + 1; p x end
	end
	total + 13
end

# fucntion checks first and last rotation not all rotation!
def cp2
	rot1= []
	rot2 = []
	permPrime = true
	total = 0;
	1.upto(1000000) do |x|
		#if (x % 1000 == 0) then p x end
		if(isPrime(x) == false) then next end
		rot1 = splitNumber(x)
		rot1.rotate!
		printf "\nChecking %d, rot1 = %s", x, rot1
		rot2 = rot1.rotate(-2).dup
		#numRot = numRot.map {|y| y.join.to_i}
		printf " - rot2 = %s", rot2
		permPrime = true
		#numRot.each do |perm|
			#printf "checking %s \n", perm
		if(isPrime(rot1.join.to_i) == false) then permPrime = false;  next end
		if(isPrime(rot2.join.to_i) == false) then permPrime = false;  next end
		#end
		#p permPrime
		total = total + 1
		printf " -- x = %d\n", x
	end
	total
end

def cp3
	rot1= []
	total = 0;
	1.upto(1000000) do |x|
		permPrime = true
		if(isPrime(x) == false) then next end
		rot1 = splitNumber(x)
		printf "\nChecking %d ", x
		1.upto(rot1.length - 1) do |x|
			rot1.rotate!
			printf " rot1 = %s", rot1
			if(isPrime(rot1.join.to_i) == false) then permPrime = false;  next end
		end
		
		if (permPrime) then total = total + 1; printf " -- x = %d\n", x end
	end
	total
end

def cp3_quicker
	rot1= []
	total = 0;
	1.upto(1000000) do |x|
		permPrime = true
		if(isPrime(x) == false) then next end
		rot1 = splitNumber(x)
		(rot1.length - 1).times do
			rot1.rotate!
			if(isPrime(rot1.join.to_i) == false) then permPrime = false;  break end
		end
		
		if (permPrime) then total = total + 1 end
	end
	total
end

p cp3_quicker
