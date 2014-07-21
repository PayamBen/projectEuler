#
# project Euler problem 61
#
# Created by Payam Behjat
# Find the sum of the only ordered set of six cyclic 4-digit numbers for which each polygonal type: triangle, square, pentagonal, hexagonal, heptagonal, and octagonal, is represented by a different number in the set.

def splitNumber(val)
	resArr = []
	x = 0
	while(val >= 1)
		x = val % 10
		resArr.push(x)
		val = val / 10
	end
	resArr.reverse
end

def pe61()
	tri,squ,pen,hex,hep,oct = [],[],[],[],[],[]
	lim = 200
	1.upto(lim) do |n|
		tri.push(n * (n + 1) / 2)
		squ.push(n ** 2)
		pen.push(n * (3 * n - 1) / 2)
		hex.push(n * (2 * n -1 ))
		hep.push(n * (5 * n - 3)/2)
		oct.push(n * (3 * n - 2))
	end
	
	tri = tri.map {|x| splitNumber(x)}
	squ = squ.map {|x| splitNumber(x)}
	pen = pen.map {|x| splitNumber(x)}
	hex = hex.map {|x| splitNumber(x)}
	hep = hep.map {|x| splitNumber(x)}
	oct = oct.map {|x| splitNumber(x)}
	tri.delete_if {|x| x.length != 4}
	squ.delete_if {|x| x.length != 4}
	pen.delete_if {|x| x.length != 4}
	hex.delete_if {|x| x.length != 4}
	hep.delete_if {|x| x.length != 4}
	oct.delete_if {|x| x.length != 4}
	#p oct.length
	#p tri.length
	#p squ.length
#=begin
	printf "%s\n",tri[-1]
	printf "%s\n",squ[-1]
	printf "%s\n",pen[-1]
	printf "%s\n",hex[-1]
	printf "%s\n",hep[-1]
	printf "%s\n",oct[-1]
#5=end
	tri.each_with_index do |t, tindex|
		if (t.length != 4) then next end
		squ.each_with_index do |s, sindex|
			if (s.length != 4) then next end
			if(t[-2] != s[0] or t[-1] != s[1]) then next end
			pen.each_with_index do |p, pindex|
				if (p.length != 4) then next end
				if(s[-2] != p[0] or s[-1] != p[1]) then next end
				if (p[-2] != t[0] or p[-1] != t[1]) then next end
				#if(tindex != sindex and sindex != pindex) then
					printf "Found - t = %s, s = %s, p = %s\n",t,s,p
				#end
			end
		end
	end

end


def pe61v2()
	poly = []
	lim = 150
	1.upto(lim) do |n|
		poly.push((n * (n + 1) / 2))
		poly.push(n ** 2)
		poly.push(n * (3 * n - 1) / 2)
		poly.push(n * (2 * n -1 ))
		poly.push(n * (5 * n - 3)/2)
		poly.push(n * (3 * n - 2))
	end

	
	poly = poly.map {|x| splitNumber(x)}
	num = 0
	poly = poly.each_with_index do |x, index|
		if(num == 6) then num = 0 end
		poly[index] = [x,num]
		num +=1
	end
	poly.each {|x| p x}
	#poly = poly.map {|y| y.delete_if {|x| x.length != 4}}
	0.upto(poly.length - 1) do |x|
		if (poly[x].length != 4) then
			poly.delete_at(x)
		end
	end
	p poly
	#p oct.length
	#p tri.length
	#p squ.length
#=begin
	printf "%s\n",poly[5]
#=end
	tri.each_with_index do |t, tindex|
		if (t.length != 4) then next end
		squ.each_with_index do |s, sindex|
			if (s.length != 4) then next end
			if(t[-2] != s[0] or t[-1] != s[1]) then next end
			pen.each_with_index do |p, pindex|
				if (p.length != 4) then next end
				if(s[-2] != p[0] or s[-1] != p[1]) then next end
				if (p[-2] != t[0] or p[-1] != t[1]) then next end
				#if(tindex != sindex and sindex != pindex) then
					printf "Found - t = %s, s = %s, p = %s\n",t,s,p
				#end
			end
		end
	end

end

def pe61v3()
	poly = {}
	lim = 180
	1.upto(lim) do |n|
		poly[splitNumber(n * (n + 1) / 2)] = 0
		poly[splitNumber(n ** 2)] = 1
		poly[splitNumber(n * (3 * n - 1) / 2)] = 2
		poly[splitNumber(n * (2 * n - 1))] = 3
		poly[splitNumber(n * (5 * n - 3)/2)] = 4
		poly[splitNumber(n * (3 * n - 2))] = 5
	end

	poly.each_pair do |k,v|
		if(v == 0) then p k end
	end
	poly.delete_if {|k,v| k.length != 4}
	ans = []
	

	poly.each_pair do |k1, v1|
		poly.each_pair do |k2, v2|
			if(k1[-2] != k2[0] or k1[-1] != k2[1] or v1 == v2) then next end
			poly.each_pair do |k3, v3|
				if(k2[-2] != k3[0] or k2[-1] != k3[1] or v2 == v3) then next end
				poly.each_pair do |k4, v4|
					if(k3[-2] != k4[0] or k3[-1] != k4[1] or v3 == v4) then next end
					poly.each_pair do |k5, v5|
						if(k4[-2] != k5[0] or k4[-1] != k5[1] or v4 == v5) then next end
						poly.each_pair do |k6, v6|
							if(k5[-2] != k6[0] or k5[-1] != k6[1] or v5 == v6) then next end
							if (k6[-2] != k1[0] or k6[-1] != k1[1]) then next end
							#ans.push([v1,v2,v3,v4,v5,v6].sort)
							ans = [v1,v2,v3,v4,v5,v6].sort
							if(ans[3] == 3) then
								printf "Found - t = %s - %d, s = %s - %d, p = %s - %d hex = %s - %d, hep = %s - %d, oct = %s - %d\n",k1,v1,k2,v2,k3,v3,k4,v4,k5,v5,k6,v6
							end
						end
					end
				end
			end
		end
	end
	#ans.each {|x| if x == [0,1,2,3,4,5] then p x end}

end

def pe61v4()
	poly = {}
	lim = 180
	1.upto(lim) do |n|
		poly[[splitNumber(n * (n + 1) / 2),0]] = 0
		poly[[splitNumber(n ** 2),1]] = 0
		poly[[splitNumber(n * (3 * n - 1) / 2),2]] = 0
		poly[[splitNumber(n * (2 * n - 1)),3]] = 0
		poly[[splitNumber(n * (5 * n - 3)/2),4]] = 0
		poly[[splitNumber(n * (3 * n - 2)),5]] = 0
	end

	poly.each_pair do |k,v|
		if(k[0].length != 4) then poly.delete(k) end
	end
	#p poly

	poly.each_pair do |k1, v1|
		poly.each_pair do |k2, v2|
			if(k1[0][-2] != k2[0][0] or k1[0][-1] != k2[0][1] or k1[1] == k2[1]) then next end
			poly.each_pair do |k3, v3|
				if(k2[0][-2] != k3[0][0] or k2[0][-1] != k3[0][1] or k2[1] == k3[1]) then next end
				poly.each_pair do |k4, v4|
					if(k3[0][-2] != k4[0][0] or k3[0][-1] != k4[0][1] or k3[1] == k4[1]) then next end
					poly.each_pair do |k5, v5|
						if(k4[0][-2] != k5[0][0] or k4[0][-1] != k5[0][1] or k4[1] == k5[1]) then next end
						poly.each_pair do |k6, v6|
							if(k5[0][-2] != k6[0][0] or k5[0][-1] != k6[0][1] or k5[1] == k6[1]) then next end
							if (k6[0][-2] != k1[0][0] or k6[0][-1] != k1[0][1]) then next end
							#ans.push([v1,v2,v3,v4,v5,v6].sort)
							ans = [k1[1],k2[1],k3[1],k4[1],k5[1],k6[1]].sort
							if(ans == [0,1,2,3,4,5]) then
								printf "%s %s %s %s %s %s\n",k1,k2,k3,k4,k5,k6
								return
							end
						end
					end
				end
			end
		end
	end
	#ans.each {|x| if x == [0,1,2,3,4,5] then p x end}

end


pe61v4()

