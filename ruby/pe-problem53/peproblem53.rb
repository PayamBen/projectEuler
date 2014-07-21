def fact(v)
sum  = 1
if v == 0 then return 1 end
1.upto(v) do |x|
sum *= x
end
sum
end

def pe53()
h = {} # creat hash
0.upto(110) do |x|
  h[x] = fact(x)
end 
#p h
count = 0
1.upto(100) do |n|
  1.upto(n) do |r|
    t = h[n] / (h[r] * h[(n - r)])
    if (t > 1000000) then
      count += 1
    end
  end
end
printf "count = %d\n", count
end

pe53()
