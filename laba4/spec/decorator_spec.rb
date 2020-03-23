require "rspec"
require_relative "../decorator"

describe User do
  it "add data User" do
    user = User.new(:first_name =>"Ivan", :last_name => "Ivanov", :date_of_birth => "01.12.2010", :height =>170, :weight =>50)
    user.first_name.should include("Ivan")
    user.last_name.should include("Ivanov")
    user.date_of_birth.should include("01.12.2010")
  end

  it "correct body mass index" do
    user = User.new(:first_name =>"Ivan", :last_name => "Ivanov", :date_of_birth => "01.12.2010", :height =>170, :weight =>50)
    userMassIndex = UserMassIndex.new(user)
    userMassIndex.index(170, 50) > 0

  end

  it "correct full name" do
    user = User.new(:first_name =>"Ivan", :last_name => "Ivanov", :date_of_birth => "01.12.2010", :height =>170, :weight =>50)
    userFullName = UserFullName.new(user)
    userFullName.fullName("Ivan","Ivanov") == "Ivan Ivanov"
  end

  it "correct body mass index New" do
    user = User.new(:first_name =>"Ivan", :last_name => "Ivanov", :date_of_birth => "01.12.2010", :height =>170, :weight =>50)
    userMassIndex = UserMassIndex.new(user)
    expect(userMassIndex.index(170, 50)).to eq(17.3)

  end

end
