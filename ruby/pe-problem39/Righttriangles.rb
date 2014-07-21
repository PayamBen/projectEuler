# Integer Right Angle Triangles  
#  
# For which value of p ≤ 1000, is the number of solutions maximised?
# 

def solution1()
	hash= {}
	per = 0
	1.upto(5000) do |a|
		a.upto(5000) do |b|
			#Calculate length of c 
			 c_P_Two = ((a ** 2) + (b ** 2))
			 if(c_P_Two ** 0.5 % 1 != 0) then next end
			 c = c_P_Two ** 0.5
			 per = c + b + a
			 if(per > 10000) then break end
			 #printf "a = %d, b = %d c = %d, p = %d\n",a,b,c,per
			 
			 if (hash.has_key?(per)) then hash[per] = hash[per] + 1
			 else hash[per] = 1 end
		end
	end
	#printHash(hash)
	hash.max_by{|k,v,| v}
end

def printHash(h)
	h.each do |key, value|
		printf "%d => %d\n", key,value
	end
end

printf "The answer is %s", solution1()
