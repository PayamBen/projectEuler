#
# project Euler problem 63 - Cubic permutations
# Created by Payam Behjat
# How many n-digit positive integers exist which are also an nth power?
#

def nlength(n)
  c = 0
  while(n >= 1) 
    n /= 10
    c += 1
  end
  c
end

def pe63()
	count = 0;
	1.upto(9) do |x|
		1.upto(21) do |y|
			if(nlength(x ** y) != y ) then next end
			count += 1
			printf "x - %d y - %d\n",x,y
		end 
	end
	printf "found - %d\n",count
end

pe63()
