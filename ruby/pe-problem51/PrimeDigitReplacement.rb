#
# project Euler problem 51 - Prime digit replacements
# Created by Payam Behjat
# Find the smallest prime which, by replacing part of the number 
# (not necessarily adjacent digits) with the same digit, is part of 
# an eight prime value family. 
#

def splitNumber(val)
	resArr = []
	x = 0
	while(val >= 1)
		x = val % 10
		resArr.push(x)
		val = val / 10
	end
	resArr.reverse
	#resArr
end

#        b = a.find_all {|item| item =~ /(1)(2)(\d)(7)/}
require 'prime'

def makePattern()
	patterns = []
	33.upto(63) do |x|
		patterns.push(x.to_s(2))
	end
	patterns
end

def pe51v2()
	#make primes list
	a = {}
	Prime.each {|x| if x > 1000000 then break elsif x < 100000 then else a[x.to_s] = 1 end}
	max, length, patLength, copy = 0, 5, 0, ""
	pattern = ""
	patterns = makePattern()
	# patterns = patterns[0..1].map {|x| x.split('')[-2..-1]} # for 10 to 100
	# patterns = patterns[0..4].map {|x| x.split('')[-3..-1]} # for 100 to 1000
	# patterns = patterns[0..32].map {|x| x.split('')[-5..-1]} # for 10000 to 100000
	patterns = patterns[0..32].map {|x| x.split('')[-6..-1]} # for 100000 to 1000000
	#p patterns
	log = []
	a.each_pair do |elem, v|
		patterns.each do |pat|
			count = 0
			0.upto(9) do |replacement|
				copy = elem.split('')
				#p copy
				#printf "pat = %s\n", pat
				0.upto(pat.length - 1) do |x|
					if(pat[x] == "1") then
						copy[x] = replacement.to_s
					end
				end
				#printf "copy = %s\n", copy.join
				if(a.has_key?(copy.join)) then 
				count += 1 
				log[replacement] = copy.join
				else
				log[replacement] = false
				end
			end
			if(count > max)
				max = count
				pattern = elem
				printf "the pattern %s has %d matches\n",pattern, max
				printf "check - > %s\n", log
			end
		end
	end
	printf "Answer the pattern %s has %d matches\n",pattern, max
end

def pe51v2clean()
	a = {}
	Prime.each {|x| if x > 1000000 then break elsif x < 100000 then else a[x.to_s] = 1 end}
	max, copy = 0, ""
	pattern = ""
	patterns = makePattern()
	# patterns = patterns[0..1].map {|x| x.split('')[-2..-1]} # for 10 to 100
	# patterns = patterns[0..4].map {|x| x.split('')[-3..-1]} # for 100 to 1000
	# patterns = patterns[0..32].map {|x| x.split('')[-5..-1]} # for 10000 to 100000
	patterns = patterns[0..32].map {|x| x.split('')[-6..-1]} # for 100000 to 1000000
	log = []
	a.each_pair do |elem, v|
		patterns.each do |pat|
			count = 0
			0.upto(9) do |replacement|
				copy = elem.split('')
				0.upto(pat.length - 1) do |x|
					if(pat[x] == "1") then
						copy[x] = replacement.to_s
					end
				end
				if(a.has_key?(copy.join)) then 
					count += 1 
					log[replacement] = copy.join
				else
					log[replacement] = false
				end
			end
			if(count > max) then
				max = count
				pattern = elem
				printf "the pattern %s has %d matches\n",pattern, max
				printf "check - > %s\n", log
				if (max == 8) then return end
			end
		end
	end
end

def germ()
	5.upto(7) do |len|
	  1.upto(len-1) do |solids|
		wildcards = len-solids
		patterns = ((0..solids-1).to_a + ('*' * wildcards).chars.to_a).permutation.to_a.uniq
		patterns.each do |pattern|
		  (0..9).to_a.repeated_combination(solids) do |selection|
			template = pattern.map{|c| c != '*' ? selection[c].to_s : c}.join
			primes = 0.upto(9).map{|w| template.gsub(/\*/, w.to_s).to_i}.select{|n| n.prime?}
			if primes.length == 8
			  p primes.first
			  exit
			end
		  end
		end
	  end
	end
end
pe51v2clean()
#makePattern()
#germ()
