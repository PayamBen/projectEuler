def digitSum(n)
  sum = 0
  while(n >= 1)
    sum += n % 10 
    n /= 10
  end
  sum
end

def pe56()
	max = 0
	11.upto(99) do |a|
		11.upto(100) do |b|
		 temp = digitSum(a ** b)
		 if(temp > max) then
			max =  temp
			printf "%d ** %d with %d difits\n",a,b,max
		 end
		end
	end
	printf "The max digits is %d\n",max
end

pe56()
