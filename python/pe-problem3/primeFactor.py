# -*- coding: utf-8 -*-
"""
Created on Sat May 25 12:52:27 2013

@author: paz
"""

def isPrimeFactor(val):
    halfPower = val ** 0.5;
    a = 3
    while a <= halfPower:
        if(val % a == 0):
            return False
        a = a + 2
    return True

target = 600851475143
halfPower = int(round((target ** 0.5)))
i = halfPower
print halfPower
while(i > 1):
    if (isPrimeFactor(i)):
        if(target % i == 0):
            print "Largest prime factor is ", i
            break
    i = i - 1