#
# project Euler problem 49 - Prime permutations
# Created by Payam Behjat
# What 12-digit number do you form by concatenating the three 
# terms in this sequence?
# REMEMBER & IS NOT A TEST OF PERMUTATIONS!!
#

require 'prime'

def splitNumber(val)
	resArr = []
	x = 0
	while(val >= 1)
		x = val % 10
		resArr.push(x)
		val = val / 10
	end
	# resArr.reverse
	resArr
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

def pe49v2()
	temp = 0
	arr = sieveOfErathosthenes(10000)
	prim = {}
	arr.each_with_index do |x, index|
		if(x) then
			if(index >= 998) then
				prim[index] = 1
			end
		end
	end
	prim.each_pair do |k,v|
		prim.each_pair do |k2,v2|
			if(k >= k2) then next end
			bb1, bc1 = false, false
			temp = k2 + (k2 - k)
			if(prim.has_key?(temp)) then
				a1 = splitNumber(k).sort
				b1 = splitNumber(k2).sort
				c1 = splitNumber(temp).sort
				if(a1 == b1 and b1 == c1) then
					printf "Found answer %d, %d, %d, dif = %d\n",k,k2,temp, k2 - k 
				end
			end
		end
	end
end

def pe49()
	temp = 0
	arr = sieveOfErathosthenes(10000)
	prim = {}
	arr.each_with_index do |x, index|
		if(x) then
			if(index >= 998) then
				prim[index] = 1
			end
		end
	end
	prim.each_pair do |k,v|
		prim.each_pair do |k2,v2|
			if(k >= k2) then next end
			bb1, bc1 = false, false
			temp = k2 + (k2 - k)
			if(prim.has_key?(temp)) then
				a1 = splitNumber(k)
				b1 = splitNumber(k2)
				c1 = splitNumber(temp)
				a1.permutation().each do |x|
					if(x == b1) then bb1 = true end
					if(x == c1) then bc1 = true end
				end
				if(bb1 and bc1) then printf "Found answer %d, %d, %d, dif = %d\n",k,k2,temp, k2 - k end
			end
		end
	end
end


def gerSolution()
	'123456789'.chars.to_a.repeated_combination(4).each do |s|
	  a = s.permutation.to_a.map(&:join).map(&:to_i).select(&:prime?)
	  seq = a.combination(3).find{|e| e[1]-e[0] != 0 && e[2]-e[1] == e[1]-e[0]}
	  p seq.join if seq != nil
	end
end

pe49v2()
