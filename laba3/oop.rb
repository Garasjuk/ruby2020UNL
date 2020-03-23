class Animals

	protected

	attr_accessor :weight, :height, :name, :age, :gender, :color, :game

	public

	def initialize(options={})
		@weight = options[:weight]
		@height = options[:height]
		@name = options[:name]
		@age = options[:age]
		@gender = options[:gender]
		@color  = options[:color]
	end

	def info
		puts "Weight #{weight}"
		puts "Height #{height}"
		puts "Name #{name}"
		puts "Age #{age}"
		puts "Gender #{gender}"
		puts "Color #{color}"
		puts "Does Human want play #{game}"
	end

	def action_run
	end

	def action_jump
	end

	def action_fly
	end

	def action_sweem
	end

	def action_games (game)
		if game == true
			@game = self.game
		else
			@game = game
		end
	end
end

class Dog < Animals
	private
	attr_accessor :security

	def initialize(options)
		@security = options[:security]
		super
		action_game
	end

	def info
		puts "Dog"
		puts "Security #{security}"
		super
	end

	def action_security
	end

	def action_game
		@game = "in game tug-of-war"
	end

	public :info
end

class Cat < Animals
	private
	attr_accessor :catch

	def initialize (options)
		@catch = options[:catch]
		super
		action_game
	end

	def info
		puts "Cat"
		puts "Catch #{catch}"
		super
	end

	def action_catch
	end

	def action_game
		@game = "in game running mouse"
	end

	public :info
end

class Bird < Animals
	private
	attr_accessor :speak

	def initialize (options)
		@speak = options[:speak]
		super
		action_game
	end

	def info
		puts "Bird"
		puts "Speak #{speak}"
		super
	end

	def action_speak
	end

	def action_game
		@game = "in game fly"
	end

	public :info
end

class Human

	dog = Dog.new(:weight => 5, :height => 0.7, :name =>"Reks", :age =>3, :gender => "m", :color => "black", :security => "hide")
	cat = Cat.new(:weight => 0.1, :height => 0.2, :name =>"Pushok", :age =>1, :gender => "m", :color => "white", :catch => "hide")
	parrot = Bird.new(:weight => 005, :height => 0.1, :name =>"Kesha", :age =>4, :gender => "m", :color => "Red", :speak => "Fast")

	dog.action_games(true)
	cat.action_games(false)
	parrot.action_games(true)

	dog.info
	cat.info
	parrot.info
end
