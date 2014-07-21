#
# project Euler problem 42 - Coded triangle numbers
# Created by Payam Behjat
# How many are triangle words are in the text file?
#

arr = File.open("words.txt").read.gsub(/\"/,"").split(",") # split word list into array
arr = arr.map {|name| name.split("").map { |letter| letter.ord - 64}.reduce(:+)} # calculate namescore
# arr.each {|x| p x}

# calculate the triangle numbes
arr2  = []
1.upto(30) do |x| 
	temp = 0.5 * x* (x + 1)
	arr2.push(temp)
end

#Compare the two arrays
arr.each_index do |x|
	if (arr2.include?(arr[x])) then arr[x] = 1 
	else arr[x] = 0 end  
end

p arr.reduce(:+)

