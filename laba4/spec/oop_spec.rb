require "rspec"
require_relative "../oop"

describe Animals do

  it "add data Dog" do
  #  animal = Animals.new(15, 0.7, "Reks", 3, "m", "black", "slow")
    dog = Dog.new(:weight => 6, :height => 0.8, :name =>"Palkan", :age =>4, :gender => "m", :color => "brown", :security => "hide")
    # dog = Dog.new(5, 0.7, "Reks", 3, "m", "black", "hide")

    expect(dog).to be_kind_of(Dog)
    dog.action_games(true)
    expect(dog.weight).to eq(6)
    expect(dog.height).to eq(0.8)
    expect(dog.name).to eq("Palkan")
    expect(dog.age).to eq(4)
    expect(dog.gender).to eq("m")
    expect(dog.color).to eq("brown")

  end
end
