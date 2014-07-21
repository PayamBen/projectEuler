#
# project Euler problem 60 - Prime Pair Sets
# Created by Payam Behjat
# Find the lowest sum for a set of five primes for which any two primes 
# concatenate to produce another prime.
#

require 'prime'

def nlength(n)
  c = 0
  while(n >= 1) 
    n /= 10
    c += 1
  end
  c
end

def pe60()
f = [3,7,109,673]
#a = {}

a = Prime.first(100)
#f.each { |x| a.delete(x)}
a = a.combination(4)

a.each do |x|
	f.push(x)
	printf "test a = %s\n", f
	if test(f) then
		printf "found %s\n", f
		return
	else
		f.pop
	end
end
printf "no answer found\n"
end

#prints list of mathces
def pe60v2()
a = Prime.first(1000)
a.delete(2);a.delete(5)
f = [3,7]
#a = a.product(a[0..5],a[1..10],a[10..1000])
#p a
#a = a.combination(5)
a.each do |x|
	#printf "test x = %s\n", x
	if test3(f,x) then
		printf "found f %s and x = %s\n", f,x
		#return
	end
end
#printf "no answer found\n"
end

#use result from short set for long set
def pe60v5(f,list)
f = [f]
min = 900000000
printf "searching from seed %s\n",f
list[0..50].each do |a|
	if (!test3(f,a) or a < f[-1]) then next end
	f.push(a)
	list[10..1000].each do |b|
		if (!test3(f,b) or b < f[-1]) then next end
	    f.push(b)
		list[50..-1].each do |c|
			if (!test3(f,c) or c < f[-1]) then next end
			f.push(c)
			list[50..-1].each do |d|
				#printf "4 ---found f %s-----\n", f
				if (test3(f,d)) then
					sum = f.reduce(:+) + d
					printf "----found f %s and x = %s, sum = %d-----\n", f,d,sum
					if(min > sum) then
						min = sum
					end
				end
			end
			f.pop()
		end
		f.pop()
	end
	f.pop()
end
end

#use result from short set for long set
def pe60v3(first,last)
fset = []
c = 0
File.open("../../../documents/primes.txt").each_line do |line|
	if( c  > 100000) then p line ; break end
	$a[line[0..-1].to_i] = 1 
	c += 1
end
$a.delete(2);$a.delete(5)
a = Prime.first(2000)
0.upto(200) do |x|
	(x + 1).upto(900) do |y|
		if(test4(a[x],a[y])) then fset.push([a[x],a[y]]) end
	end
end
min = 100000
fset.each do |f|
	if (!test(f)) then next end
	n = []
	printf "searching all primes with seed %s----------\n", f
	a.each do |x|
		if(x < f[-1]) then next end
		if test3(f,x) then
			n.push(x)
		end
	end
	n.each do |x|
		f.push(x)
		n.each do |y|
			if(y < f[-1]) then next end
			if test3(f,y) then
				#printf "found f %s and x = %s\n", f,y
				f.push(y)
				n.each do |z|
					if(z < f[-1]) then next end
					if test3(f,z) then
						sum = f.reduce(:+) + z
						printf "----found f %s and x = %s, sum = %d\n------", f,z,sum
						if(min > sum) then min = sum end
					end
				end
				f.pop()
			end
		end
		f.pop()
	end
end
printf "minimum was %d\n",min 
end

def testPrime(v)
	if(v > 1200000) then
		return Prime.prime?(v)
	end
	return $a.has_key?(v)
end

$fset = {}
$a = {}

def pe60v6()
a = Prime.first(2000)
c = 0
File.open("../../../documents/primes.txt").each_line do |line|
	if( c  > 100000) then p line ; break end
	$a[line[0..-1].to_i] = 1
	c += 1
end
printf "array loaded\n"
#temp.each {|x| $a[x] = 1}
printf "largest prime in array = %d", $a.length
a.delete(2);a.delete(5)
0.upto(a.length - 1) do |x|
	(x + 1).upto(a.length - 1) do |y|
		if(test4(a[x],a[y])) then $fset[[a[x],a[y]]] = 1 end
	end
end
printf "fset length = %d", fset.length

min = 200000
fset.each_pair do |f, v|
	n = []
	printf "searching all primes with seed %s----------\n", f
	a.each do |x|
		if(x < f[-1]) then next end
		if test5(f,x) then
			n.push(x)
		end
	end
	n.each do |x|
		f.push(x)
		n.each do |y|
			if(y < f[-1]) then next end
			if test5(f,y) then
				f.push(y)
				n.each do |z|
					if(z < f[-1]) then next end
					if test5(f,z) then
						sum = f.reduce(:+) + z
						if(min > sum) then min = sum end
						printf "----found f %s and x = %s, sum = %d min = %d--------\n", f,z,sum,min
						if(min > sum) then min = sum end
					end
				end
				f.pop()
			end
		end
		f.pop()
	end
end
printf "minimum was %d\n",min 
end

def pe60v4(str, pos)
	if(str.length == 5) then printf "level 5 found str = %s sum = %d--------------\n",str, str.reduce(:+); return end
	if(str.length == 4) then printf "level 4 found str = %s\n",str end
	n = []
	pos.each do |y|
		if(y < str[-1]) then next end
		if test3(str,y) then
			n.push(y)
		end
	end
	n.each do |z|
		str.push(z)
		pe60v4(str,n)
		str.pop()
	end
end

def test(f)
	f.each do |x|
		f.each do |y|
			if(x == y) then next end
			x2 = x
			x2 = x2 * 10 ** nlength(y)
			x2 += y
			#printf "x2 = %d\n",x2
			if(!Prime.prime?(x2)) then return false end
		end
	end
	return true
end

#this test shouldn't test the new part together
def test2(old, new)
	old.each do |x|
		new.each do |y|
			if(x == y) then next end
			x2 = x
			x2 = x2 * 10 ** nlength(y)
			x2 += y
			if(!Prime.prime?(x2)) then return false end
		end
	end
	new.each do |x|
		new.each do |y|
			if(x == y) then next end
			x2 = x
			x2 = x2 * 10 ** nlength(y)
			x2 += y
			if(!Prime.prime?(x2)) then return false end
		end
	end
	return true
end

def test3(old, new)
	old.each do |x|
		if(x == new) then  end
		x2 = x
		x2 = x2 * 10 ** nlength(new)
		x2 += new
		if(!Prime.prime?(x2)) then return false end
	end
	old.each do |x|
		if(x == new) then  end
		x2 = x
		new2 = new
		new2 = new * 10 ** nlength(x2)
		x2 += new2
		if(!Prime.prime?(x2)) then return false end
	end
	return true
end

def test4(old, new)
	#check adding to end
	x2 = old * 10 ** nlength(new)
	x2 += new
	if(!testPrime(x2)) then return false end

	# check adding to the front
	#o2 = old
	#n2 = new
	x2 = new * 10 ** nlength(old)
	x2 += old
	if(!testPrime(x2)) then return false end
	return true
end

def test5(old, new)
	old.each do |x|
		if(x == new) then  end
		x2 = x
		x2 = x2 * 10 ** nlength(new)
		x2 += new
		if(!testPrime(x2)) then return false end
	end
	old.each do |x|
		if(x == new) then  end
		x2 = x
		new2 = new
		new2 = new * 10 ** nlength(x2)
		x2 += new2
		if(!testPrime(x2)) then return false end
	end
	return true
end


def solver()
	a = Prime.first(11000)
	a.delete(2);a.delete(5)
	t1 = Thread.new{pe60v3(0,20)}
	t2 = Thread.new{pe60v3(0,30)}
	t3 = Thread.new{pe60v3(0,40)}
	t1.join;t2.join;t3.join
end
#p test3([3,7,109],673)
#p test([3,7,109,673,241])
#test(f)
#solver()
#pe60v3(0,600)
# test4(345,678)
#a = Prime.first(11000)
#	a.delete(2);a.delete(5)
#pe60v5(7,a)
#pe60v4([9],a)

#1.upto(1000) {|x| printf "%d = %s\n",x,testPrime(x)}
pe60v3(0,900)
