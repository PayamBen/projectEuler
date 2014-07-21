#
# project Euler problem 33 - Digit canceling fractions
# Created by Payam Behjat
#

def splitNumber(val)
	resArr = []
	while(val >= 1)
		resArr.push(val % 10)
		val = val / 10
	end
	resArr
end

def removeMatching(val1, val2)
	resArr1 = splitNumber(val1)
	resArr2 = splitNumber(val2)
	res = resArr1 & resArr2
end

realTar, temp,temp2,prod  = 0,0,0,1.0
matching = []
arrX, ArrY = [],[]
11.upto(99) do |x|
	(x + 1).upto(99) do |y|
		if(x % 10 == 0 or y % 10 == 0) then next end
		realTar = Float(x)/y
		#printf "matching x = %d y= %d, result %s",x , y, 
		matching = removeMatching(x,y)
		if (matching.length == 0) then next end
		arrX = splitNumber(x).reverse
		arrY = splitNumber(y).reverse
		for number in matching do
			temp = (arrX - [number]).reduce(:+)
			temp2 = (arrY - [number]).reduce(:+)
			if(temp.nil? == false and temp2.nil? == false) then
				#printf " %d / %d = %d \n",temp,temp2,Float(temp)/temp2
				if(realTar == Float(temp)/temp2) then
					printf "%d / %d  =  when cancel %d\n",x,y,number
					prod = prod * realTar
				end
			end
		end
	end
end
prod = prod.round(7).to_s
p Rational(prod)
