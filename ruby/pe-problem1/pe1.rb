printf 'Calculate the sum of 3 and 5 less than a target'
limit = 100000000
mult = 3
a = 1
total = 0
t = a * 3
t2 = a * 5
while t < limit do
	if (t2 % 3 != 0 and t2 < limit)then total += t2 end
    total += t
    a += 1
	t = a * 3
	t2 = a * 5
end
printf "The total of the multiples of 3 and 5 less than %d is %d\n", limit, total
