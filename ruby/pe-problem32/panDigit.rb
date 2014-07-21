#
# project Euler problem 32 - Pandigital products
# Created by Payam Behjat
# Find the sum of all products whose multiplicand/multiplier/product 
# identity can be written as a 1 through 9 pandigital.
#

def splitNumber(val)
	resArr = []
	while(val >= 1)
		resArr.push(val % 10)
		val = val / 10
	end
	resArr
end

def splitNumberPlusCheck(val)
	resArr = []
	temp = 0
	while(val >= 1)
		temp = val % 10
		if(temp == 0) then
			return [0]
		end
		resArr.push(temp)
		val = val / 10
	end
	resArr
end

def meathod1 ()
	checkCard = [1,1,1,1,1,1,1,1,1,1]
	cVal = []
	138.upto(2000) do |a|
		1.upto(a - 1) do |b|
			c = a * b
			resArr = splitNumberPlusCheck(b).concat(splitNumberPlusCheck(a).concat(splitNumberPlusCheck(c)))
			resArr.each do |x|
				checkCard[x] = checkCard[x] - 1
			end
			if(checkCard == [1,0,0,0,0,0,0,0,0,0])
				printf "a = %d, b = %d, c = %d\n",a,b,c
				cVal.push(c)
			end
			checkCard = [1,1,1,1,1,1,1,1,1,1]
		end
	end
	cVal = cVal.uniq
#	p cVal
	cVal.reduce(:+)
end

#Super quick!
def meathod4 ()
	checkCard = [1,1,1,1,1,1,1,1,1,1]
	cVal = []
	1234.upto(9876) do |c|
		1.upto(c** 0.5) do |a|
			b = c / a
			if (c % b != 0) then  next end
			resArr = splitNumberPlusCheck(b).concat(splitNumberPlusCheck(a).concat(splitNumberPlusCheck(c)))
			resArr.each do |x|
				checkCard[x] = checkCard[x] - 1
			end
			if(checkCard == [1,0,0,0,0,0,0,0,0,0])
				printf "a = %d, b = %d, c = %d\n",a,b,c
				cVal.push(c)
			end
			checkCard = [1,1,1,1,1,1,1,1,1,1]
		end
	end
	cVal = cVal.uniq
#	p cVal
	cVal.reduce(:+)
end

#very slow
def meathod2 ()
	#checkCard = [1,1,1,1,1,1,1,1,1,1]
	temp = ""
	cVal = []
	138.upto(2000) do |a|
		1.upto(a - 1) do |b|
			c = a * b
			temp = [a,b,c].map {|x| x.to_s}.join
			temp = temp.split('').sort.join
			if(temp == "123456789")
				printf "a = %d, b = %d, c = %d\n",a,b,c
				cVal.push(c)
			end
		end
	end
	cVal = cVal.uniq
	cVal.reduce(:+)
end

#slow
def meathod3 ()
	#checkCard = [1,1,1,1,1,1,1,1,1,1]
	cVal = []
	138.upto(2000) do |a|
		1.upto(a - 1) do |b|
			c = a * b
			resArr = splitNumber(b).concat(splitNumber(a).concat(splitNumber(c))).sort.join
			#p resArr
			if(resArr == "123456789") then
				cVal.push(c)
			end
			#checkCard = [1,1,1,1,1,1,1,1,1,1]
		end
	end
	cVal = cVal.uniq
	cVal.reduce(:+)
end
#	
def lemonkola()
	products = []

	(1..9).to_a.permutation(9).each do |pandigit|
	  # [1 digit] * [4 digits] = [4 digits]
	  mult1 = pandigit[0...1].join.to_i
	  mult2 = pandigit[1...5].join.to_i
	  prod  = pandigit[5..-1].join.to_i
	  if mult1 * mult2 == prod
		products.push prod
		puts "#{mult1} * #{mult2} = #{prod}"
	  end

	  # [2 digits] * [3 digits] = [4 digits]
	  mult1 = pandigit[0...2].join.to_i
	  mult2 = pandigit[2...5].join.to_i
	  prod  = pandigit[5..-1].join.to_i
	  if mult1 * mult2 == prod
		products.push prod
		puts "#{mult1} * #{mult2} = #{prod}"
	  end
	end
	products.uniq.inject(:+)
end

def bbsChat()
	$num = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  $sum_num = []

  def check_1_4_4(a)
    x = a[0]
    y = a[1] * 1000 + a[2] * 100 + a[3] * 10 + a[4]
    z = a[5] * 1000 + a[6] * 100 + a[7] * 10 + a[8]
    return z if x * y == z
    return 0
  end 
    
  def check_2_3_4(a)
    x = a[0] * 10 + a[1]
    y = a[2] * 100 + a[3] * 10 + a[4]
    z = a[5] * 1000 + a[6] * 100 + a[7] * 10 + a[8]
    return z if x * y == z
    return 0
  end 

  def set_all(a)
    if a.size == 9
      $sum_num << a.join()[5,4] if check_1_4_4(a) != 0
      $sum_num << a.join()[5,4] if check_2_3_4(a) != 0
      return
    end

    ($num - a).each {|i| set_all(a + [i])}
  end
  
  set_all([])
  sum = 0
  $sum_num.uniq.each {|i| sum += i.to_i}
  p sum
end

def sris()
	ids = [] 
	(1234..9876).each { |prod| 
		(1..Math.sqrt(prod)).each { |x| 
			if prod % x == 0 then ids << [x, prod / x, prod] end
		} 
	} 
	p ids.select { |id| 
		digits = id.join("").split("").sort.join("") 
		digits.size == 9 && digits == "123456789" 
		}.map { |x| x.last }.uniq.inject(0) { |s, x| s + x }
end

printf "Meathod 1 - The total of the unique products is = %d\n", meathod4()
#printf "Meathod 2 - The total of the unique products is = %d\n", meathod3()
