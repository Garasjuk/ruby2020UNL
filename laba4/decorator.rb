require "parsedate"
require "date"
include ParseDate

#Шаблон позволет намдобовлять поведение к объекту без необходимости добовлять это повеление к классу объекта

class User
  attr_accessor :first_name, :last_name, :date_of_birth, :height, :weight

  def initialize(options={})
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @date_of_birth= options[:date_of_birth]
    @height = options[:height]
    @weight = options[:weight]
  end

  def info
    puts "First name #{first_name}"
    puts "Last name #{last_name}"
    puts "Date of birth #{date_of_birth}"
    puts "Height #{height}"
    puts "Weight #{weight}"
  end
end

class UserFullName
  attr_accessor :result
  def initialize(user)
    @user = user
  end

  def fullName(first_name, last_name)
    result ="#{first_name} #{last_name}"
    return result
  end

  def info
    puts "Full name: #{fullName(@user.first_name, @user.last_name)}"
  end
end

class UserBirthday

  def initialize(user)
    @user = user
  end

  def info
    mass = parsedate(@user.date_of_birth)
    puts DateTime.new(mass[0],mass[1],mass[2]).strftime("%d/%m/%y")
    puts DateTime.new(mass[0],mass[1],mass[2]).strftime("%A-%m-%Y")
    puts DateTime.new(mass[0],mass[1],mass[2]).strftime("%d %B %y")
    puts DateTime.new(mass[0],mass[1],mass[2]).strftime("%A.%B.%Y")
  end
end

class UserMassIndex
  attr_accessor :result
  def initialize(user)
    @user = user
  end

  def index (height,weight)
    result = weight / ((height.to_f/100)**2).round(2)
    return result.round(2)
  end

  def info
     puts "Body mass index: #{index(@user.height,@user.weight)}"
    # puts "Body mass index: #{@user.weight / ((@user.height.to_f/100)**2)}"
  end

end

user1 = User.new(:first_name =>"Ivan", :last_name => "Ivanov", :date_of_birth => "01.12.2010", :height =>170, :weight =>50)
user2 = User.new(:first_name =>"Ivan", :last_name => "Ivanov", :date_of_birth => "01.12.2010", :height =>170, :weight =>50)
user3 = User.new(:first_name =>"Ivan", :last_name => "Ivanov", :date_of_birth => "01.12.2010", :height =>170, :weight =>50)

user1 = UserFullName.new(user1)
user1.info
user2 = UserBirthday.new(user2)
user2.info
user3 = UserMassIndex.new(user3)
user3.info
