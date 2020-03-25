require "rspec"
require_relative "../connect"

describe Connect  ApplicationCable::Connection do
  it "connect with host and port" do
    propertis = Propertis.new(:host => "smtp@mail.ru", :port => 587, :username => "my@mail.ru", :pass => "12345")
    connect = Connect.new(propertis)
    expect(connect.host).to eq("my@mail.ru")
    expect(connect.port).to eq(587)

  end

  it "connect and disconnect" do
    propertis = Propertis.new(:host => "smtp@mail.ru", :port => 587, :username => "my@mail.ru", :pass => "12345")
    connect = Connect.new(propertis)
    connect "smtp@mail.ru"
    expect(connect.host).to eq("smtp@mail.ru")
  end

  context "connect" do
    before(:each) do
      @connect = mock(Connect)
      @connect.stub!(:connctEmail).and_return("Connect is true")
    end

    it "connect email return Connect is true" do
      @connect.should_receive(:connctEmail).and_return("Connect is true")
      answer = @connect.connctEmail
      answer.should match("Connect is true")
    end
  end
end
