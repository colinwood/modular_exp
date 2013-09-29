##
#A simple program for evaluating fibonacci's nth number as well as calculating modular exponentiaiton.
#I then test the timing for each of the methods. 
## 

class Mod_Expo_Fibo 

	def self.fibonacci_recursive(n)
		if n < 2
		return n
		end	

		return fibonacci_recursive(n-1) + fibonacci_recursive(n-2)			
	end

	def self.fibonacci_iterative(n)
		if n == 0 
			return n			
		else 
			x=0
			y=1
			i=1
			until i == (n) do				
				z = x+y
				x = y
				y = z
				i += 1				
			end				
		return y
		end				
	end

	def self.modular_exponentiation_recursive(b,n,m)
		if n == 0
			return 1
		elsif n % 2 == 0
			return modular_exponentiation_recursive(b, n/2, m)**2 % m
		else
			return (((modular_exponentiation_recursive(b, (n-1)/2, m)**2) % m * b % m) % m)		
		end
	end

	def self.modular_exponentiation_iterative(b,n,m)
		x = 1
		i = 1
		while i != n + 1 do
			x = (x * b) % m
			i = i + 1
		end
		return x
	end	

end


start = Time.now
puts Mod_Expo_Fibo.modular_exponentiation_recursive 7,644,645
puts Mod_Expo_Fibo.modular_exponentiation_recursive 11,644,645
puts Mod_Expo_Fibo.modular_exponentiation_recursive 3,2003,99
puts Mod_Expo_Fibo.modular_exponentiation_recursive 123,1001, 101
print  "Time to complete recursively in seconds: "
puts Time.now - start
puts

start = Time.now
puts Mod_Expo_Fibo.modular_exponentiation_iterative 7,644,645
puts Mod_Expo_Fibo.modular_exponentiation_iterative 11,644,645
puts Mod_Expo_Fibo.modular_exponentiation_iterative 3,2003,99
puts Mod_Expo_Fibo.modular_exponentiation_iterative 123,1001, 101
print  "Time to complete iteratively in seconds: "
puts Time.now - start
puts

puts
start = Time.now
#Find the first 30 fibonacci numbers recursively.
i = 0
until i == 30 do
	puts "R - #{i} - #{Mod_Expo_Fibo.fibonacci_recursive i}" 
	i += 1
end
stop = Time.now
recursive_timing = stop - start
puts "Completed in #{recursive_timing} seconds"


puts
start = Time.now
#Find the first 30 fibonacci numbers iteratively.
i = 0
until i == 30 do
	puts "I - #{i} - #{Mod_Expo_Fibo.fibonacci_iterative i}" 
	i += 1
end
stop = Time.now
iterative_timing = stop - start
puts "Completed in #{iterative_timing} seconds"
puts
puts "Iteratively solving fibonnaci was #{recursive_timing - iterative_timing} seconds faster." 

