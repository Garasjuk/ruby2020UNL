require "rspec"
require_relative "../propertis"

describe Propertis do
  it "propertis for email" do
    propertis = Propertis.new(:host => "smtp@mail.ru", :port => 587, :username => "my@mail.ru", :pass => "12345")
    expect(propertis.host).to eq("smtp@mail.ru")
    expect(propertis.port).to eq(587)
    expect(propertis.username).to eq("my@mail.ru")
    expect(propertis.pass).to eq("12345")
  end

  it "propertis other email" do
    propertis = Propertis.new(:host => "smtp@mail.ru", :port => 587, :username => "my@mail.ru", :pass => "12345")
    propertis.stub(:host) do |arg|
        if arg == "smtp@mail.ru"
          send.to = "smtp@gmail.com"
        else
        end
    end
    expect(propertis.host).to eq("smpt@gmail.com")
  end

  context "propertis" do
    before(:each) do
      @propertis = mock(Propertis)
      @propertis.stub!(:getPropertis).and_return("Email propertis")
    end

    it "propertis email return Email propertis" do
      @propertis.should_receive(:getPropertis).and_return("Email propertis")
      answer = @propertis.getPropertis
      answer.should match("Email propertis")
    end
  end
end
