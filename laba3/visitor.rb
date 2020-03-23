
#Шблон позволяет определять новую операцию без изменения классов элементов с которыми он работает

module Visitable
  def accept(visitor)
    visitor.visit(self)
  end
end

class Product
  include Visitable
  attr_accessor :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end
end

class Order
  include Visitable

  def initialize
    @elements = []
  end

  def add(element)
    @elements << element
  end

  def accept(visitor)
    @elements.each {|e| e.accept(visitor)}
  end
end

class Visitor
  def visit(subject)
    raise NotImpelementedError.new
  end
end

class Printer < Visitor
  def visit(subject)
    puts "Product: #{subject.name} - $#{subject.price}"
  end
end


p1 = Product.new(name: "Phone", price: 100)

order = Order.new
order.add(p1)
order.accept(Printer.new)
