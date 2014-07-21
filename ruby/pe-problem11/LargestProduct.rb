#
# LargestProduct.rb
# Created by Payam Behjat
# What is the greatest product of four adjacent numbers in the same direction 
# (up, down, left, right, or diagonally) in the 20×20 grid?

def searchGrid()
	range = 4
	total = 1
	max = 0 
	temp = 0
	line = ""
	0.upto(19) do |y|
		0.upto(19) do |x|
			0.upto(range - 1) do |plus|
				if(x + plus < 20) then
					temp = ($grid[y][x + plus]).to_i
					total = total * temp
				end
			end
			if(total > max) then
				max= total
				line = "y = #{y}, x = #{x} right, #{$grid[y][x]}, #{$grid[y][x+1]}, #{$grid[y][x+2]}, #{$grid[y][x+3] } --- with #{total}"
			end
			total = 1;
			0.upto(range - 1) do |plus|
				if(y + plus < 20) then
					temp = ($grid[y + plus][x]).to_i
					total = total * temp
				end
			end
			if(total > max) then
				max= total
				line = "y = #{y}, x = #{x} right, #{$grid[y][x]}, #{$grid[y + 1][x]}, #{$grid[y + 2][x]}, #{$grid[y + 3][x] } --- with #{total}"
			end
			total = 1
			0.upto(range - 1) do |plus|
				if(y + plus < 20 and x + plus < 20) then
					temp = ($grid[y + plus][x + plus]).to_i
					total = total * temp
				end
			end
			if(total > max) then
				max= total
				line = "y = #{y}, x = #{x} right, #{$grid[y][x]}, #{$grid[y + 1][x + 1]}, #{$grid[y + 2][x + 2]}, #{$grid[y + 3][x + 3] } --- with #{total}"
			end
			total = 1
			0.upto(range - 1) do |plus|
				if(y - plus < 20 and x + plus < 20) then
					temp = ($grid[y - plus][x + plus]).to_i
					total = total * temp
				end
			end
			if(total > max) then
				max= total
				line = "y = #{y}, x = #{x} right, #{$grid[y][x]}, #{$grid[y - 1][x + 1]}, #{$grid[y - 2][x + 2]}, #{$grid[y - 3][x + 3] } --- with #{total}"
			end
			total = 1	
		end
	end
	return line

end


$buffer = ""
$a = 0
$grid = Array.new(20) { Array.new(20) }
aFile = File.new("input.txt")
aFile.each_line do |line| 
	line = line.gsub(/\s+/,"")
	$grid[$a] = line.scan(/../)
	$a = $a + 1
end
printf "Largest product producing line is %s\n", searchGrid()
