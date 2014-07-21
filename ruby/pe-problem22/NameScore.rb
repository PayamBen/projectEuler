#
# project Euler problem 22 - Name scores
# Created by Payam Behjat
# What is the total of all the name scores in the file?
#

#arr = File.open("names.txt").read.split("\n").map {|names| names.gsub(/\"/,"")}
#arr = File.open("names.txt").read.split(",")#.gsub(/\"/,"")

def example1()
	arr = File.open("names.txt").read.gsub(/\"/,"").split(",")
	p arr
	p arr.index("COLIN")
	arr = arr.sort 
	p arr.index("COLIN") # REMEMBER TO PLUS 1 TO INDEX

	p arr
	#p "a".ord
	arr = arr.map {|name| name.split("").map { |letter| letter.ord - 64}.reduce(:+)}
	#p arr[937]
	arr = arr.each_with_index.map { |namescore,index| namescore * (index + 1)}
	p arr[937]
	p arr.reduce(:+)
end

def example2()
	arr = File.open("names.txt").read.gsub(/\"/,"").split(",").sort() # open and sort
	arr = arr.map {|name| name.split("").map { |letter| letter.ord - 64}.reduce(:+)} #replace char with ascii values total
	p arr.each_with_index.map { |namescore,index| namescore * (index + 1)}.reduce(:+) # multiple index with namescore and sum up
end

example2
	

