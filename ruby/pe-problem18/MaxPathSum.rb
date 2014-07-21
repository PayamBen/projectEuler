#
# MaxPathSum.rb
# created by Payam Behjat
# problem 18 from project euler
#

def maxPath arr
	(arr.length - 2).downto(0) do |y|
		0.upto(arr[y].length - 1) do |x|
			arr[y+1][x] > arr[y+1][x+1] ? arr[y][x] = arr[y+1][x] + arr[y][x] : arr[y][x] = arr[y+1][x + 1] + arr[y][x]
		end
	end
	arr[0][0]
end



arr = File.open("triangle.txt").read.split("\n").map {|x| x.gsub(/\s+/,"").scan(/../).map(&:to_i)}
#p arr
p maxPath(arr)


