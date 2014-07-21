#
# project Euler problem 54 - Poker Hands
# Created by Payam Behjat
# How many hands does player one win? 
#

def samesuit?(h)
	if(h['D'] == 5 or h['C'] == 5 or h['H'] == 5 or h['S'] == 5)
		return true
	end
	return false
end

$cv = ['2','3','4','5','6','7','8','9','T','J','Q','K','A'].reverse

def highCard(h)	
	$cv.each_with_index {|e, index| if(h.has_key?(e)) then return index end} # high card
end

def handRank(h)
	three, pair,seq, straight = '', [], 0, false
	ss = samesuit?(h)
	$cv.each_with_index {|e, index| if(h[e] == 4) then return [8,index] end} # four of a kind
	$cv.each_with_index {|e, index| if(h[e] == 2) then pair.push(index) end}
	$cv.each_with_index {|e, index| if(h[e] == 3) then three = index end}
	if(three != '' and pair.length == 1) then 
		return [7,three,pair[0]]  # full house
	elsif(three != '') 
		return [4,three]# three of a kind
	end
	if (pair.length == 2) then return [3,pair[0],pair[1]] end # two pairs
	if (pair.length == 1) then return [2,pair[0]] end # pair
	if(h['A'] and h['K'] and h['Q'] and h['J'] and h['T'] and ss) then
		return [10,1] # royal flush
	end
	$cv.each do |e|
		if(h.has_key?(e) and seq == 0) then seq = 1; next end
		if(seq == 4 and h.has_key?(e)) then straight = true; break
		elsif(h.has_key?(e) and seq != 0) then seq += 1
		elsif(!h.has_key?(e) and seq != 0) then break end #not straight 
	end
	if(straight and ss) then 
		return [9,highCard(h)] # straight flush
	elsif(straight) then
		return [5,highCard(h)] # straight
	end
	if(ss) then return [6,highCard(h)] end # flush
	
	return [1,highCard(h)] # high card
end

def pe54()
	p1w, p2w,c = 0, 0,0
	File.open("poker.txt") do |file|
		while (buffer = file.read(30)) do
			h1, h2, c = {}, {}, c + 1
			0.upto(13) do |x|
				if(h1.has_key?(buffer[x])) then
					h1[buffer[x]] = h1[buffer[x]] + 1
				else
					h1[buffer[x]] = 1
				end
			end
			15.upto(28) do |x|
				if(h2.has_key?(buffer[x])) then
					h2[buffer[x]] = h2[buffer[x]] + 1
				else
					h2[buffer[x]] = 1
				end
			end
			
			#evaluate hands
			hr1 = handRank(h1)
			hr2 = handRank(h2)
			if(hr1[0] > hr2[0]) then p1w += 1#; printf "P1 -  %s --> %s ranking %s --> %s\n",buffer[0..13],buffer[15..28],hr1,hr2
			elsif(hr1[0] < hr2[0]) then p2w += 1# ; printf "P2 - %s --> %s ranking %s --> %s\n",buffer[0..13],buffer[15..28],hr1,hr2
			else 
				if(hr1[1] < hr2[1]) then 
					p1w += 1
				elsif (hr1[1] > hr2[1]) then
					p2w += 1
				else
					printf "Draw %d, %s --> %s ranking %s --> %s\n",c,buffer[0..13],buffer[15..28],hr1,hr2
				end
			end
		end
	end
	printf "Player 1 won %d hands, player 2 won %d hands\n",p1w,p2w
end

pe54()
