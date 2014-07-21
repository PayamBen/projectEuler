require 'continued_fractions' 
require 'bigdecimal'
require 'bigdecimal/util'
 
include ContinuedFractions

def test2
	oddPeriod = 0
	passRate = 3
	fractionLimit = 25
	2.upto(13) do |y|
		if((y ** 0.5) % 1 == 0) then next end
		sr = y ** 0.5
		cf = ContinuedFraction.new(sr,fractionLimit)
		arr = []
		cf.quotients[1..-1].each do |x|
			arr.push(x)
			if(arr.size % 2 == 0) then
				
				half = arr.size / 2 - 1
				if(arr[0..half] == arr[half + 1..-1]) then
					if ((half + 1) % 2 != 0) then
						printf "count %d, Found period (%d) with %s\n",y, half + 1,arr[0..half]
						oddPeriod += 1
					end
					break
				end
			end
		end
	end
	printf "Found %d Odd Periods\n",oddPeriod
end

def compareArr(arr,cf,passRate, c, y)
	pass = true
	if(c > 2) then passRate = 2 end
	1.upto(passRate) do |x|
		pass = true
		g = (x * c)
		#printf "checking %d Compare %s --- %s",y, arr,cf[g + 1..g+c]
		if(arr != cf[g + 1..g + c]) then
			pass = false
		#	printf " - no match\n"
			break
		else
		#	printf " - found\n"
		end
	end
		
	if pass then
		return c
	end
	return -1
end

def pe64
	oddPeriod = 0
	passRate = 2
	fractionLimit = 100
	2.upto(100) do |y|
		if((y ** 0.5) % 1 == 0) then next end
		#sr = y ** 0.5
		cf = ContinuedFraction.new(y ** 0.5,fractionLimit)
		cf = cf.quotients
		# find pattern
		arr = []
		found = false
		1.upto(fractionLimit / passRate) do |c|
			arr = cf[1..c]	
			c = compareArr(arr,cf,passRate,c, y)
			if c >= 1 then 
				if c % 2 != 0 then oddPeriod +=1 end
				found = true
				break
			end
				
		end
		if found == false then printf "No match - %d\n", y; p cf
		else printf "Match found\n", y end
	end
	printf "Found %d Odd Periods\n",oddPeriod
end

def test1
	7683.upto(7684) do |y|
		sum = BigDecimal.new(y)
		sum = sum.sqrt(2)
		p sum.to_s("10F")
		if((y ** 0.5) % 1 == 0) then next end
		cf = ContinuedFraction.new(sum,300)
		cf = cf.quotients
		printf "%d -- %s\n",y, cf
	end
		
end

def test3
	sum = 3 ** 0.5
	cf = ContinuedFraction.new(sum,300)
	cf = cf.quotients
	printf "%s\n", cf
end


test3
#pe64
