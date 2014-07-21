#
# project Euler problem 66 - Diophantine equation
# Find the value of D ≤ 1000 in minimal solutions of x for which the largest value of x is obtained.
#

def pe66()
	printf "Using meathod pe66 \n";
	da = [2]
	limit = 5
	3.upto(limit) do |x|
		if((x ** 0.5) % 1 == 0) then next end
		da.push(x)
	end
	p da.length
	max = 0;
	
	da.each do |d|
		sx = 1
		oddx = 3
		oddy = 3
		1.upto(limit) do |x|
			sy, oddy = 1, 1
			sx += oddx
			oddx += 2 
			1.upto(limit) do |y|
				sy += oddy
				#printf "sx = %d , sy = %d\n",sx, sy
				oddy += 2
				if(sx - (d * sy) != 1) then next end
				if(x > max) then
					max = x
					printf "Found x = %d y = %d d = %d\n",x,y,d;
				end
			end
		end
	end
	
end

def minSolution(d)
	sx = 1
	oddx = 3
	1.upto(50000) do |x|
		sy, oddy = 1, 3
		sx += oddx
		#sx = x ** 2
		oddx += 2 
		1.upto(x) do |y|
			sy = y ** 2
			#if((sx - (d * sy)) > 1) then break end
			if(sx - (d * sy) != 1) then next end
			return x
		end
	end
	return 90000009
end

def minSolution2(d)
	sx = 1
	oddx = 3
	1.upto(200000) do |x|
		sy, oddy = 1, 3
		sx += oddx
		#sx = x ** 2
		oddx += 2 
		1.upto(x) do |y|
			sy += oddy
			oddy += 2
			if((sx - (d * sy)) < 1) then break end
			if(sx - (d * sy) != 1) then next end
			return x
		end
	end
	return 90000009
end

require 'prime'

def pe66v3()
	printf "Using meathod pe66v3 \n";
	da = [2]
	maxD = 0
	40.upto(1000) do |x|
		if((x ** 0.5) % 1 == 0) then next end
		if(Prime.prime?(x)) then next end
		da.push(x)
	end
	p da.length
	max = 0;
	z = 0;
	da.each do |d|
		x = minSolution2(d)
		printf "d = %d with x = %d\n",d,x
		if(x > max) then
			max = x
			maxD = d
		end
	end
	printf "Found x = %d from %d\n",max,maxD
end

def pe66v4()
	printf "Using meathod pe66v3 \n";
	sx = 1.0
	oddx = 3
	1.upto(100000) do |x|
		sy, oddy = 1.0, 3
		1.upto(x) do |y|
			
			t= ((sx - 1) / sy)
			if t % 1 != 0 then next end
			if(t >  1 and t < 1000) then 
				printf "Found x = %d y = %d d = %d\n",x,y,t
				break
			end
			sy += oddy
			oddy += 2
		end
		sx += oddx
		oddx += 2 
	end
end

def pe66v2()
	printf "Using meathod pe66v2 \n";
	da = [2]
	3.upto(8) do |x|
		if((x ** 0.5) % 1 == 0) then next end
		x = x ** 0.5
		da.push(x)
	end
	max = 0;
	t = 0;
	da.each do |d|	
		1.upto(10) do |x|
			1.upto(10) do |y|
				t = d * y + 1
					#printf "t = %f x = %d d = %d \n",t,x, d ** 2
				if(t != x ) then break end
				if(x > max) then
					max = x
					printf "Found x = %f y = %f d = %f\n",x,y,d
				end
			end
		end
	end
end

# Brute Force Solution, the correct answer will be the last output
def pe66v5()
	printf "Using meathod pe66v5 \n";
	da = [2]
	3.upto(1000) do |d|
		if((d ** 0.5) % 1 != 0) then 
			da.push(d)
		end
		
	end
	da.each do |d|
		printf "%d ",d
	end
	printf "\n"
	max = 0;
	total = 0;
	da.each do |d|	
		1.upto(10000) do |x|
			1.upto(10000) do |y|
				total = d * (y ** 2 ) + 1
				if(total != x ** 2 ) then next end
				if(x > max) then
					max = x
					printf "Found x = %d d = %d y = %d\n",x,d,y
				end
			end
		end
	end
end


def  continuedFraction()

printf "Starting Calculation \n";
pe66v5()

