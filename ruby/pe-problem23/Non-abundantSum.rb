#
# project Euler problem 23 - Non-abundant sum
# Created by Payam Behjat
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
#
$firstAbundant = 12
$limit = 28130

def divisorSum(num)
	arr = [1]
	(2..num ** 0.5).each do |n| 
		if (num % n == 0) then
			arr << n 
			arr << num/n 
		end
	end
	arr.uniq!
	arr.reduce(:+)
end

#runs in 48 sec
def example1()
	arr = 1.upto($limit).each_with_index.map {|index| if (divisorSum(index) > index + 1) then index end}.compact
	#arr.each_with_index { |n,index| if(n.nil? == false) then printf "index %d = %d\n",index, n end  }
	#p divisorSum(16)
	p arr
	arr = arr.product(arr)
	#p arr
	#p "---------------------"
	arr = arr.map {|mylist| mylist.reduce(:+)  }.uniq!
	total = 0
	1.upto($limit) do |index|
	if(arr.include?(index) == false) then
			total = total + index
			#p index
		end
	end
	total
end

# runs in 14 sec
def example2()
	arr = 1.upto($limit).each_with_index.map {|index| if (divisorSum(index) > index + 1) then index end}.compact
	#arr.each_with_index { |n,index| if(n.nil? == false) then printf "index %d = %d\n",index, n end  }
	#p divisorSum(16)
	#p arr
	#arr = arr.product(arr)
	#arr2 = {}
	arr.sort
	arr2 = []
	i = 0
	while (i < arr.length)
		j = 0
		while(j < arr.length)
		#if(arr[i] + arr[j] <= $limit and arr2[arr[i] + arr[j]].nil? == false) then
		#	arr2.merge(i => arr[i] + arr[j])
		#end
		if(arr[i] + arr[j] <= $limit) then
			arr2.push(arr[i] + arr[j])
		else
			break
		end
		j = j +1
		end
		i = i + 1
	end
	arr2 = arr2.uniq!
	p arr2
	#p "---------------------"
	#arr = arr.map {|mylist| mylist.reduce(:+)  }.uniq!
	total = 0
	1.upto($limit) do |index|
		if(arr.include?(index) == false) then
			total = total + index
			#p index
		end
	end
	total
end

def sum_of_two?(set)
    set.any? { |x| set.include?(self-x) }
  end

def example3()
	arr = 1.upto($limit).each_with_index.map {|index| if (divisorSum(index) > index + 1) then index end}
	arr = arr.to_set
	filtered = (1..$limit).reject { |n| n.sum_of_two?(arr) }
	ans = filtered.reduce(:+)
end
  
p example3()
