#NumLetterCnt.rb
# problem 17 - project euler
# If all the numbers from 1 to 1000 (one thousand) inclusive were written 
# out in words, how many letters would be used? 
# created by payam behjat
#

def numTranslate(val)
				   #0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
	letterCntLwr = [0,3,3,5,4,4,3,5,5,4, 3, 6, 6, 8, 8, 7, 7, 9, 8, 8] # 0 to nineteen
	letterCnt  = {20 => 6, 30 => 6, 40 => 5, 50 => 5, 60 =>5, 70 =>7, 80 => 6, 90 =>6}
	stringVal = val.to_s.split("").reverse
	curIndex = stringVal.length - 1
	wordLength = 0
	andUsed =false
	if(curIndex == 3) then # 1000 unit
		wordLength = wordLength + 8 # add thousand
		wordLength = wordLength + letterCntLwr[stringVal[curIndex].to_i]
		curIndex = curIndex -1
	end
	if(curIndex == 2 and stringVal[curIndex].to_i != 0) then
		wordLength = wordLength + 7 # add hundred
		wordLength = wordLength + letterCntLwr[stringVal[curIndex].to_i]
		curIndex = curIndex -1
	end
	if(curIndex == 1) then
		if((stringVal[curIndex].to_i != 0 or stringVal[curIndex - 1].to_i != 0) and wordLength > 0) then # add and
			wordLength = wordLength + 3
			andUsed = true
		end
		if (stringVal[curIndex].to_i < 2) then
			doubleDigit = ""
			doubleDigit  << stringVal[curIndex] <<  stringVal[curIndex - 1]
			wordLength = wordLength + letterCntLwr[doubleDigit.to_i]
			curIndex = -1
		else
			doubleDigit = ""
			doubleDigit  << stringVal[curIndex] << "0"
			wordLength = wordLength + letterCnt[doubleDigit.to_i]
			curIndex = curIndex - 1
		end
	end
	if(curIndex == 0) then
		wordLength = wordLength + letterCntLwr[stringVal[curIndex].to_i]
	end
	wordLength
end

$target, $total = 1000, 0

1.upto($target) {|x| $total = $total + numTranslate(x)}

p $total
