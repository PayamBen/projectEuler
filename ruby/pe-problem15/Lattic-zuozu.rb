def lattice_paths(num)
   arr = Array.new(num+1, Array.new(num+1, 1))
   (1..num).each do |i|
      (1..num).each do |j|
         arr[i][j] = arr[i-1][j] + arr[i][j-1]
      end
   end
   arr[num][num]
end

p lattice_paths(200)


#p "Or by ameican"
#puts (2*20).downto(1).inject(:*) / 20.downto(1).inject(:*)**2
