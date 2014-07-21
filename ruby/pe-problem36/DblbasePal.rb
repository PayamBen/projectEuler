#  Double-base palindromes
#  
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#   
 
# a = 17.to_s(2) meathod for getting binary value

#val should be a string
def isPalindromic(val)
	ln = val.length
	middle = ln / 2.0
	arr = val.split('')
	0.upto(middle) do |x|
		if(arr[x] != arr[ln - x - 1]) then return false end
	end
	return true
end

#p isPalindromic("1234321")  #Testing function
sum = 0
1.upto(1000000) do |x|
	if(isPalindromic(x.to_s) and isPalindromic(x.to_s(2))) then sum = sum + x end
end

print sum
