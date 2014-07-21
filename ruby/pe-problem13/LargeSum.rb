#  LargeSum.rb
#  
#  
#  


# add the single digits from each line
def prog2
	aFile = File.open("input.txt").read.scan(/./).map {|x| x.to_i}.inject {|sum, n| sum + n}
end

# add each lines
def prog3
	aFile = File.open("input.txt").read.split("\n").map {|x| x.to_i}.inject {|sum, n| sum + n}.to_s[0...10]
end

#p (1..5).reduce(:+)
#p prog3

p File.open("input.txt").read.split("\n").map {|x| x.to_i}.inject {|sum, n| sum + n}.to_s[0...10]







