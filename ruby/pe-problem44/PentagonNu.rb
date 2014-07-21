#
# project Euler problem 44 - Pentagon numbers
# Created by Payam Behjat
# Find the pair of pentagonal numbers, Pj and Pk, for which their sum 
# and difference are pentagonal and D = |Pk − Pj| is minimised; what is the value of D?
#  Pn=n(3n−1)/2. 

# very slow for key look up
def pe44()
	pN = []
	1.upto(3000) do |n|
		pN.push(n * ((3 * n) - 1) * 0.5)
	end
	min = 1000000
	pN.each do |x|
		pN.each do |y|	
			if(pN.include?(x + y)) then
				if(pN.include?(y - x)) then
					printf "found %d and %d = %d\n",  x,y,x + y
					if(min > y - x ) then
						min = y - x
					end
				end
			end 
		end
	end
	printf "The minimum was %d\n", min
end


def pe44v2()
	pN = {}
	1.upto(3000) do |n|
		pN[(n * ((3 * n) - 1) * 0.5)] = n
	end
	min, temp = 1000000, 0
	pN.each_pair do |k,v|
		pN.each_pair do |k2,v2|
			if(pN.has_key?(k + k2)) then
				temp = k2 - k
				if(pN.has_key?(k2 - k)) then
					printf "found %d and %d = %d\n",  k,k2,temp
					if(min > temp) then min = temp end
				end
			end 
		end
	end
	printf "The minimum was %d\n", min
end

pe44()

