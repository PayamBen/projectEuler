#  SmallestMult.rb
#  
#  Smallest Mult problem 5
#  What is the smallest positive number that is evenly divisible 
#  by all of the numbers from 1 to 20?
#  

def howDivisible(val)
	#halfPower = val ** 0.5
	#halfPower.round()
	2.upto(21) do |x|
		return x - 1 if(val % x != 0)
	end
	 
	return 21
end

$a = 200000000
$temp
while (true)
	$temp = howDivisible($a)
	if($temp > 15) then
		printf "mega Divisible is = %d with %d\n", $a, $temp
		if($temp >= 20) then
			break
		end
	end
	$a = $a + 1
end

