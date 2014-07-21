#  10001Prime.rb
#  
# What is the 10 001st prime number?
#  
#  


def isPrime(val)
        if(val == 1) then return false end
        if(val == 2) then return true end
        if(val % 2 == 0) then return false end
        halfPower = val ** 0.5
        a = 3
        while a <= halfPower
            if(val % a == 0)
                return false
            end
           a +=2 
        end    
        
        return true
end

$a = 2
$count = 0 
$target = 10001
while(true)
	if(isPrime($a)) then
		$count += 1
	end
	if ($count == $target) then
		printf "The %d prime number is %d\n", $target, $a
		break
	end
	$a = $a + 1
end

