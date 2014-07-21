#  SumDifference.rb
#  
#  Find the difference between 1**2 + .. n**2
#  and (1+..+n)**2 WHERE n = 100
#  


def sumDifference(limit) 
	sumTotal = 0;
	squareTotal = 0;
	1.upto(limit) do |x|
		sumTotal += x**2
		squareTotal += x
	end
	squareTotal = squareTotal ** 2
	squareTotal - sumTotal
end

print sumDifference(100) 

