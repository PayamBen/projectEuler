#
# project Euler problem 62 - Cubic permutations
# Created by Payam Behjat
# Find the smallest cube for which exactly five permutations of its digits are cube.
#

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

def pe62()
	cube = {}
	4642.upto(9999) do |x|
		cube[[splitNumber(x ** 3).sort, x]] = 0
	end
	min = 10000
	cube.each_pair do |k1,v1|
		cube.each_pair do |k2,v2|
			if(k1[0] != k2[0]) then next end
			cube.each_pair do |k3,v3|
				if(k2[0] != k3[0]) then next end
				cube.each_pair do |k4,v4|
					if(k3[0] != k4[0]) then next end
					cube.each_pair do |k5,v5|
						if(k4[0] != k5[0]) then next end
						ans = [k1[1],k2[1],k3[1],k4[1],k5[1]].uniq
						if(ans.length != 5) then next end
						printf "Found - %s %s %s %s %s\n",k1,k2,k3,k4,k5
						if(min > k1[1]) then
							min = k1[1]
						end
						return
					end
				end
			end
		end
	end
	printf "Min = %d\n", min
end


pe62()
