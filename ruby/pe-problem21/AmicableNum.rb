#
# project Euler problem 21 - Amicable Numbers
# Created by Payam Behjat
# Evaluate the sum of all the amicable numbers under 10000.
#
 
# Bad Meathod !!!!! very slow || WORK ANSWER !!
def divisorSum(num)
	arr = [1]
	(2..num ** 0.5).each do |n| 
		if (num % n == 0) then
			arr << n 
			arr << num/n 
		end
	end
	arr.reduce(:+)
end

## Better Meathod !! WRONG ANSWER!!
def divisorSum2(num)
	total = 1
	if(num > 1) then
		(2..num ** 0.5).each { |n| if (num % n == 0) then total = total + n + num/n end}
	else
		return 0
	end
		total
end

def evalAmic(limit)
	arr = 0.upto(limit).map { |x| divisorSum2(x)}
	p arr
	i = 0
	total = 0
	ammArr = []
	while (i < arr.length - 1 ) do
		if(arr[i].nil? == false) then
			if(arr[i] < limit) then
				if(i == arr[arr[i]] and arr[i] != arr[arr[i]]) then
					total = total + i
					ammArr.push(i)
				end
			end
		end
		i = i + 1
	end
	p ammArr
	total
end

$target= 10000
printf "the total Amicable numbers from 0 to %d is %d\n",$target, evalAmic($target)
