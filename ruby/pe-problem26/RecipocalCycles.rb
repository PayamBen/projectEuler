#
# project Euler problem 26 - Reciprocal cycles
# Created by Payam Behjat
# Find the value of d < 1000 for which 1/d contains the longest 
# recurring cycle in its decimal fraction part.
#

# valSize must be a integer
# This function may produce incorrect values as the repeat value 
# is only checked once!!
def checkCycles(val,valSize)
	comLength = valSize / 2
	val = val.to_s.split('')
	1.upto(valSize / 2) do |comLength|
		if(val[0..comLength - 1] == val[comLength..(comLength * 2) - 1]) then
			#printf "Repeat length = %d\n", comLength
			#break
			return comLength
		end
	end
	#printf "no Repeats found\n"
	return 0
end

base = 5999
power = 10**base
max, temp, index = 0, 0, 0 
2.upto(1000) do |x|
	printf "checking 1/%d with base %d\n",x, base + 1
	temp = checkCycles(power/x, base + 1  )	
	if temp > max then max = temp; index = x end
	#max = if (checkCycles(power/x, base + 1  ) > max) then index = x end 
end
printf "The largest REcipocal cycle is %d from 1/%d",max,index


#checkCycles(123451234512345,15)
