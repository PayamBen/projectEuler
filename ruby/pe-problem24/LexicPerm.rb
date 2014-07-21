#
# project Euler problem 24 - Lexicographic permutations
# Created by Payam Behjat
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
#

#meathod 1
def lexicPerm1(list)
	lex_perms = list.permutation(10).to_a
	puts lex_perms[1_000_000 - 1].join()
end

######## functions for meathod 2 !! Not Working !!

def swap(a, i, j) 
	temp = a[i]
	a[i] = a[j]
	a[j] = temp
	return a
end

def hasNext(a)
	size = a.length
	# find rightmost element a[k] that is smaller than element to its right
	k = 0
	#for (k = N-2; k >= 0; k--)
	(size-2).downto(0) do |k|
		if (a[k] < a[k+1]) then break end
	end
	if (k == -1) then return false end
	

	# find rightmost element a[j] that is larger than a[k]
	j = size -1
	while (a[k] > a[j])
		j = j - 1
	end
	a = swap(a, j, k)

	#for (int r = N-1, s = k+1; r > s; r--, s++)
	r = size - 1
	s = k + 1
	while(r > s) 
		a = swap(a, r, s)
		r = r - 1
		s = s + 1
	end
	return a
end

def perm(size)
	a = (0..(size-1)).map {|x| x}
	p a	
	x = 1
	while ( a = hasNext(a)) 
		if (x == 999999) then
		   printf "a = %s\n", a # print permutation
		   break
		end
		printf "a = %s\n", a
	   x = x + 1
	end
end

# recursive method
def lexicPerm2(list, availList, target, count)
	
	if(availList.size == 0) then
		count = count + 1
		if(target == count) then printf "the result is %s count = %d\n", list.join, count end
		return count
	end
	0.upto(availList.size - 1) do |c|
		temp = availList.dup
		temp2 = list.dup
		availList.delete_at(c)
		list.push(temp[c])
		count = lexicPerm2(list, availList,target,count)
		if(count == target) then
			return count
		end
		availList = temp.dup
		list = temp2.dup
	end
	return count
end

list2 = [0,1,2,3,4,5,6,7,8,9]
list = []
p "Recusive Meathod"
lexicPerm2(list, list2,1000000,0)
