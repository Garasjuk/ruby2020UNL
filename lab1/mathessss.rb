class Mathesss
	def fibonaci(n)
		if n == 0
			return 0
		elsif n == 1
			return 1
		else
			return fibonaci(n - 1) + fibonaci(n - 2) 
		end
	end
	
	def power(n)
		return 2**n
	end
end

mathesss = Mathesss.new()
puts "Enter number: "
a = gets()
puts "Fibanaci " + a
puts mathesss.fibonaci(a.to_i)
puts "Power " + a
puts mathesss.power(a.to_i)
