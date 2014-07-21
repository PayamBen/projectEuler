
def flip(i)
  r = 0
  while(i >= 1)
    r = r * 10
    r += i % 10
    i = i / 10
  end
  r
end

def test(a)
  a = a.to_s()
  l = a.length - 1
  0.upto(l / 2) do |x|
    if (a[x] != a[l - x]) then
        return false
    end
  end
  return true
end

def pe55() 
 c = 0
 10.upto(9999) do |x| 
   found = false
   1.upto(50) do |r|
     x += flip(x)
     if (test(x)) then 
       found = true
       break 
     end
   end
   if(!found) then 
     c += 1
     printf "found %d\n", x
   end
 end
 printf "the answer is %d\n",c
end

p pe55()