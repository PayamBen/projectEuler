#
# project Euler problem 58 - Spiral Primes
# Created by Payam Behjat (based on problem 28)
#

require 'prime'

def sieveOfErathosthenes(limit)
	a = Array.new(limit, true) 
	sqLimit = limit ** 0.5
	2.upto(sqLimit) do |x|
		if(a[x]) then
			j = x ** 2
			while(j < limit)
				a[j] = false
				j += x
			end
		end
	end
	#a.each_with_index {|x,index| printf "index = %d = %s\n",index,x}
	a
end	

#a = {}
#Prime.first(1000) {|p| a[p] = 1}

#p a

x, pc, total = 1, 0.0, 1.0
nw, ne, se, sw, gS = 0, 0 ,0, 0, 0
#a = sieveOfErathosthenes(100000000)
#prim = {}
#a.each_with_index do |x, index|
#	if x then prim[index] = 1 end
#end

begin
	#gS = (x * 2) + 1
	#sw = ((gS ** 2) - (gS - 1)) 
	#se = gS ** 2
	#nw = ((gS - 2) ** 2) + ((2 * gS) - 2)
	#ne = (gS - 2) ** 2 + (gS - 1)
	#printf "gridsSize = %d, ne= %d, se = %d, sw = %d, nw = %d\n",gS , ne, se, sw, nw
	gS = (x * 2) + 1
	total += 4
	if (Prime.prime?((gS ** 2) - (gS - 1))) then pc +=1  end 
	if (Prime.prime?(gS ** 2)) then pc += 1 end 
	if (Prime.prime?(((gS - 2) ** 2) + ((2 * gS) - 2))) then pc +=1 end 
	if (Prime.prime?((gS - 2) ** 2 + (gS - 1))) then pc += 1 end 
	#printf "x = %d primes = %d, per = %f\n",gS,pc,pc / total
	x += 1
end while (pc / total >= 0.10)

printf "grid size %d\n", gS
