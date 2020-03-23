#Символ - обсалютно идентичны ссылаются на один объект 
#Строка - обсалютно идентичны будут разными оъетами
str1 = "Rybu is a pure object-oriented programming language"
str2 = "It was created in 1993"
puts "Количество символов"
puts str1.length
puts str2.length
puts " "
puts "Заменасимвола а на симвл b"
puts str1.tr('a','b')
puts " "
puts "Соединение строк Конкатенация"
puts str1 +" "+	str2 #Конкатенация
puts " "
puts "Соединение строк Интерполяция"
puts "#{str1} #{str2}" #Интерполяция
puts " "
puts "Количество слов"
a="#{str1} #{str2}".split(' ')
puts a.length
puts " "

