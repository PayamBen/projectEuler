#
# FactSum.rb
# Project euler problem 20
# Created By Payam Behjat 
# Find the sum of the digits in the number 100!
#

p (1..100).reduce(:*).to_s.scan(/./).map {|x| x.to_i}.reduce(:+)

##By GandRalph
t = (1..100).to_a.reduce(:*).to_s.split('').map(&:to_i).reduce(:+)
