#  gridCal.rb
#  
#  Find the greatest product of five consecutive digits in the 1000-digit number.
#  
#  

#meathod 1
def fiveDigitProduct(buffer) 
	a = 0
	b = 4
	total = 1
	max = 0
	series = "0101"
	while (b < 1000) 
		buffer[a..b].each_char do |x|
			total = total * x.to_i
		end
		if(total > max) then
			max = total
			series = buffer[a..b]
		end
		a = a + 1
		b = b + 1
		total = 1
	end
	printf "\noutput - %d with %s\n", max, series
end

def fiveDigitProduct2(buffer)
	buffer

end


$buffer = ""
aFile = File.new("inputFile.txt")
aFile.each_line do |line| 
	$buffer << line
end
$buffer = $buffer.gsub(/\s+/,"")
printf "#{$buffer}\nLargest product from 5 numbers in #{$length} series is\n"
fiveDigitProduct($buffer)

