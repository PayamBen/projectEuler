#
# project Euler problem 43 - Sub-string divisibility
# Created by Payam Behjat
# nFind the sum of all 0 to 9 pandigital numbers with this property.
#

=begin
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
=end

def pe43()
total = 0
arr = [0,1,2,3,4,5,6,7,8,9].permutation
arr.each do |e|
	if(e[1..3].join.to_i % 2 != 0) then next end
	if(e[2..4].join.to_i % 3 != 0) then next end 
	if(e[3..5].join.to_i % 5 != 0) then next end 
	if(e[4..6].join.to_i % 7 != 0) then next end 
	if(e[5..7].join.to_i % 11 != 0) then next end 
	if(e[6..8].join.to_i % 13 != 0) then next end 
	if(e[7..9].join.to_i % 17 != 0) then next end
	printf "answer %s\n", e
	total += e.join.to_i
	#p e
	end
	printf "the total is %d\n", total
end

pe43()
