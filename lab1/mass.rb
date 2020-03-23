puts "Создание массива"
str = "1 25 34 54 15 34 22 55"
a = str.split #Используя метд split разбивая строкна массив 
b = [1, 25, 34, 54, 15, 34, 22, 55] #Задать в квадратныех скобках
puts " "
puts "Элементы массива b"
puts b
puts " "
puts "Длинна масси b"
puts b.length
puts " "
puts "Сумма всех элементов"
puts b.inject(0){|result, elem| result + elem}
puts " "
result1 = 0
b.each do |b|
	result1 = result1 + b
end
puts result1
puts ""
result2 = 0
for i in b do
	result2 = result2 + i
end
puts result2
puts " "
puts "Объединение в одну строчку"
puts a.join
puts " "
puts "Увеличение каждого элемента массива"
b=b.map{|elem| elem = elem +1}
puts b
puts " "
puts " "
