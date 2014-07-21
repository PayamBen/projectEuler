#  LargePrimeFactor.rb
#  Development by Payam Behjat
#  


def isPrime(val)
        if(val == 1) 
			return false
		end
        if(val == 2) 
			return true
		end
        if(val % 2 == 0)
            return false
        end
        halfPower = val ** 0.5;
        a = 3
        while a <= halfPower
            if(val % a == 0)
                return false
            end
           a +=2 
        end    
        
        return true
end


def pe03()
	$target = 600851475143
	$halfpower = $target ** 0.5
	$halfpower = $halfpower.round()
	$halfpower.downto(2) do |n|
		if (isPrime(n) == true) then
			if($target % n == 0) then
				printf "Largest Prime factor is %d\n", n
				break
			end
		end
	end
end

require 'prime'

def pe03v2()
	a = 600851475143.prime_division
	p a[-1]
end

pe03v2()

