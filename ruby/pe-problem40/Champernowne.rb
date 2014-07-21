# Champernowne's constant
# problem 40 
# 
# Calculate -> d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

def splitNumber(val)
	resArr = []
	while(val >= 1)
		resArr.push(val % 10)
		val = val / 10
	end
	resArr.reverse
end

arr = []
temp = {}
1.upto(200000) do |x|
	#temp = x.to_s.split('').map {|x| x.to_i}
	if (x % 10000 == 0) then p x end
	temp = splitNumber(x)
	arr.push(temp)
end
arr.flatten!
p arr.length
answer = arr[0] * arr[9] * arr[99] * arr[999] * arr[9999] * arr[99999] * arr[999999]
printf "the answer is %d", answer
