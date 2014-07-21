
import profile
def howDivisible(val):
    for x in range(1,21):
         if (val % x != 0):
             return x - 1	 
    return 21

def p1():
    a = 200000000
    temp = 0
    while (1 == 1):
        temp = howDivisible(a)
        if(temp > 20):
            print "mega Divisible is = %d with %d" %(a, temp)
            if(temp >= 16):
                break
        a = a + 1
    return
 
#profile.run('p1()')
p1()
