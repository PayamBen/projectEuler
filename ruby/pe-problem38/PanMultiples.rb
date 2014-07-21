# Pandigital multiples
#  
# What is the largest 1 to 9 pandigital 9-digit number that can be 
# formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
# 

def isPanDigit (val)
	checkCard = [1,1,1,1,1,1,1,1,1,1]
	val.each do |x|
		checkCard[x] = checkCard[x] - 1
	end
	if(checkCard == [1,0,0,0,0,0,0,0,0,0]) then  return true end
	return false
end


def splitNumber(val)
	resArr = []
	while(val >= 1)
		resArr.push(val % 10)
		val = val / 10
	end
	resArr
end

def getOneToNinePan(val)
	pan = val.to_s
	x, cal = 2, val
	while(pan.length < 9)
		cal = val * x
		pan.concat(cal.to_s)
		x = x + 1
	end
	if(pan.length > 9) then return -1 end
	if isPanDigit(splitNumber(pan.to_i)) then return pan.to_i end
	return -1
end




#loop from 1 to 999 
#p getOneToNinePan(999)
max, highestx, pan = 0,0,0
9.upto(9999) do |x|
	pan = getOneToNinePan(x)
	if(pan > max) then max = pan; highestx = x end
end


printf "The higest pandigital = %d ,by %d\n", max, highestx
