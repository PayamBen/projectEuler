#
# project Euler problem 45 - Triangular, pentagonal, and hexagonal
# Created by Payam Behjat
# It can be verified that T285 = P165 = H143 = 40755.
# Tn=n(n+1)/2 - Pn=n(3n−1)/2 - Hn=n(2n−1)
# Find the next triangle number that is also pentagonal and hexagonal. 

def pe45()
	hT = {} # n+1 / 2
	hP = {} # (3n - 1) / 2
	hH = {} # 2n - 1
	165.upto(80000) do |n|
		hP[((3 * n) - 1) * 0.5 * n] = 1
	end
	285.upto(80000) do |n|
		hT[(n + 1) * 0.5 * n] = 1
	end
	143.upto(80000) do |n|
		hH[((2 * n) -1.0) * n] = 1
	end
	
	arr = hP.to_a & hT.to_a & hH.to_a
	printf "the matches are %s", arr
end

pe45()

