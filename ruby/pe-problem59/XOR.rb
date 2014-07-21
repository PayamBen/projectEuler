#
# project Euler problem 59 - XOR decryption
# Created by Payam Behjat
#

#require "profile"

#time 3.7 sec
def pe59s3()
	ct = File.open("cipher1.txt").read.gsub(/\n/,"").split(",").map {|x| x.to_i}
	pwLength = 3
	printf "cipher text = %s\n", ct
	pw = ('a'..'z').to_a
	pw = pw.product(pw,pw).map {|x| x.join}
	wl = {} # try to use hash for performance
	File.open("shortWordList.txt").read.split.map {|word| wl[word] = 1}
	pw.each_with_index do |e, index|
		c = 0
		decode = []
		ct.each do |x|
			if(c == pwLength) then c = 0 end
			d = (x ^ e[c][0].ord).chr
			decode.push(d)
			c += 1
		end
		
		decode = decode.join
		decode2 = decode.split(' ')
		passrate,matches = 15,0 
		decode2.each do |t|
			if(wl.has_key?(t)) then
				matches += 1
				if(matches == passrate) then
					printf "found solution - key = %s\nDecode = %s\n",e, decode
					asciiTotal = 0
					0.upto(decode.length - 1) do |z|
						asciiTotal += decode[z][0].ord
					end
					printf "total acsii values = %d\n", asciiTotal
					return
				end
			end
		end		
	end
 printf "password not found\n"
end

#full solution but comparing the whole file to find the key
def pe59s4()
	ct = File.open("cipher1.txt").read.gsub(/\n/,"").split(",").map {|x| x.to_i}
	pwLength = 3
	pw = ('a'..'z').to_a
	pw = pw.product(pw,pw).map {|x| x.join}
	wl = {} # try to use hash for performance
	File.open("shortWordList.txt").read.split.map {|word| wl[word] = 1}
	pw.each_with_index do |e, index|
		c = 0
		decode = []
		ct.each do |x|
			if(c == pwLength) then c = 0 end
			d = (x ^ e[c][0].ord).chr
			decode.push(d)
			c += 1
		end
		#p decode	
		decode2 = decode.join.split(' ')
		#decode2 = decode.split(' ')
		passrate,matches= 15,0
		decode2.each_with_index do |t, index|
			if(wl.has_key?(t)) then
				matches += 1
				if(matches > passrate) then
					printf "found solution - key = %s\nDecode = %s\n",e, decode2
					asciiTotal = 0
					asciiTotal = decode.map {|z| z[0].ord}.reduce(:+)
					printf "total acsii values = %d\n", asciiTotal
					return
				end
			end
		end		
	end
 printf "password not found\n"
end

#Only decode 0..100 bytes to find key
def pe59s5()
	filename = "cipher1.txt"
	ct = File.open(filename).read.gsub(/\n/,"").split(",").map {|x| x.to_i}
	pwLength = 3
	pw = ('a'..'z').to_a
	pw = pw.product(pw,pw).map {|x| x.join}
	wl = {}
	File.open("wordList.txt").read.split.map {|word| wl[word] = 1}
	pw.each_with_index do |e, index|
		c = 0
		d1 = []
		ct[0..100].each do |x|
			if(c == pwLength) then c = 0 end
			d = (x ^ e[c][0].ord).chr
			d1.push(d)
			c += 1
		end
		d2 = d1.join.split(' ')
		passrate,matches= 5,0
		d2.each_with_index do |t, index|
			if(wl.has_key?(t)) then
				matches += 1
				if(matches > passrate) then
					clearText = decode(e,filename)
					printf "found key = %s Decode = %s\n",e, clearText.join
					printf "Total Ascii value is %d",clearText.map{|x| x[0].ord}.reduce(:+)
					return
				end
			end
		end		
	end
 printf "password not found\n"
end

def pe59s5String(ct, pwLength)
	#ct = File.open(filename).read.gsub(/\n/,"").split(",").map {|x| x.to_i}
	pw = ('a'..'z').to_a
	#pw = pw.product(pw,pw,pw).map {|x| x.join}
	pw = pw.repeated_permutation(pwLength).map {|x| x.join}
	wl = {}
	File.open("wordList.txt").read.split.map {|word| wl[word] = 1}
	pw.each_with_index do |e, index|
		c = 0
		d1 = []
		ct[0..100].each do |x|
			if(c == pwLength) then c = 0 end
			d = (x ^ e[c][0].ord).chr
			d1.push(d)
			c += 1
		end
		d2 = d1.join.split(' ')
		passrate,matches= 5,0
		d2.each_with_index do |t, index|
			if(wl.has_key?(t)) then
				matches += 1
				if(matches > passrate) then
					clearText = decode2(e,ct)
					printf "found key = %s \nDecode = %s\n",e, clearText.join
					printf "Total Ascii value is %d",clearText.map{|x| x[0].ord}.reduce(:+)
					return
				end
			end
		end		
	end
 printf "password not found\n"
end



#change the test for dictonary lookup, and random password
def pe59s2()
	text = "simple test hello world"
	pwLength = 3
	ct = cipher(text,'jha')
	printf "cipher text = %s\n", ct
	pw = ('a'..'z').to_a
	pw = pw.product(pw,pw).map {|x| x.join}
	wl = {} # try to use hash for performance
	File.open("wordList.txt").read.split.map {|word| wl[word] = 1}
	pw.each_with_index do |e, index|
		c = 0
		decode = []
		ct.each do |x|
			if(c == pwLength) then c = 0 end
			printf "password index = %d, password ascii = %d cypt-acsill = %d\n",index,e[c][0].ord,x#e[]
			d = (x ^ e[c][0].ord).chr
			decode.push(d)
			c += 1
		end
		
		decode = decode.join
		decode = decode.split(' ')
		decode.each do |t|
			if(wl.has_key?(t)) then
				printf "found solution - key = %s\nDecode = %s\n",e, decode 
				return
			end
		end		
	end
 printf "password not found\n"
end

def pe59s()
	text = "simple test hello world"
	pwLength = 3
	ct = cipher(text,'kjk')
	printf "cipher text = %s\n", ct
	pw = ['bhg','rdf','jfj','lkk','kjk']
	pw.each_with_index do |e, index|
		c = 0
		decode = []
		ct.each do |x|
			if(c == pwLength) then c = 0 end
			printf "password index = %d, password ascii = %d cypt-acsill = %d\n",index,e[c][0].ord,x#e[]
			d = (x ^ e[c][0].ord).chr
			decode.push(d)
			c += 1
		end
		
		decode = decode.join
		if (decode == text) then 
		printf "found solution - key = %s\nDecode = %s\n",e, decode 
		return
		end
	end
 printf "password not found\n"
end

def decode(key, filename)
	pwLength = key.length
	ct = File.open(filename).read.gsub(/\n/,"").split(",").map {|x| x.to_i}
	c, y = [], 0
	ct.each do |x|
		if(y == pwLength) then y = 0 end
		c.push(x ^ key[y].ord)
		y += 1
	end
  c = c.map {|x| x.chr}
  c
end

def decode2(key, ct)
	pwLength = key.length
	c, y = [], 0
	ct.each do |x|
		if(y == pwLength) then y = 0 end
		c.push(x ^ key[y].ord)
		y += 1
	end
  c = c.map {|x| x.chr}
  c
end

def cipher(text, key)
  pwLength = key.length
  text = text.split('').map {|x| x[0].ord}
  c, y = [], 0
  text.each do |x|
	if(y == pwLength) then y = 0 end
	c.push(x ^ key[y].ord)
	y += 1
  end
  c
end

#ciper with comma spaces
def cipher2(text, key)
  pwLength = key.length
  text = text.split('').map {|x| x[0].ord}
  c, y = [], 0
  text.each do |x|
	if(y == pwLength) then y = 0 end
	c.push(x ^ key[y].ord)
	c.push(',')
	y += 1
  end
  c.join
end

#test performs
# 1 - encrypt a file
# attemp to find solution
def test2()
	lt = cipher(File.open("text2.txt").read, 'ghas')
	#p decode2('pass',lt).join
	pe59s5String(lt,4)
end
test2()
#p cipher2(File.open("text2.txt").read, 'ghas')

#pe59s5()

