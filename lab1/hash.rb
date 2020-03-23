#a={}
#a=Hash.new
#a=Hash[]
x = {"a" => "ax", "b" => "bx", "c" => "cx"}
y = {:a => "ay", :b => "by", :c => "cy"}
z = {a: "az", b: "bz", c: "cz"}
puts "Обход хэш"
z.each do |key|
	puts key
end
puts ""
puts "Ключи"
z.each_key do |key|
	puts key
end
puts " "
puts "Знчение"
z.each_value do |value|
	puts value
end
puts " "
puts "Значение ключ - Ключ знчение"
puts z.invert
puts " "
puts "Содержит ли Хеш ключ"
puts x.has_key?("r")
puts x.has_key?("a")
puts " "



