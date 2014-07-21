# PythagoreanTriplet.rb
#
# Created By Payam Behjat
#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def isPythTriplet(a,b,c)
	if(a**2 + b**2 == c**2) then
		puts "Found!!!!!!!!!"
		return true
	end
	return false

end

def mainLoop() 
	1.upto(1000) do |a|
		a.upto(($target - a) /2) do |b|	
			if ($target - (a + b) > b) then
				if(isPythTriplet(a,b,$target - (a + b))) then
					printf "a = %d, b = %d, c = %d\n",a,b,$target - (a + b)
					printf "Product = %d\n", a * b * ($target - (a + b))
					return
				end
			end
		end
	end
end

$target = 1000
$aThird = $target/3
$aThird = $aThird.round()
mainLoop()


