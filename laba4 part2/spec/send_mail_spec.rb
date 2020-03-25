require "rspec"
require_relative "../send_mail"

describe Send do
  it "send full message Send" do
    send = Send.new(:from =>"my@mail.ru", :to =>"guest@mail.ru", :title => "Title", :text => "Message")
    expect(send.from).to eq("my@mail.ru")
    expect(send.to).to eq("guest@mail.ru")
    expect(send.title).to eq("Title")
    expect(send.text).to eq("Mesage")
  end

  it "send full message with stub Send" do
    send = Send.new(:from =>"my@mail.ru", :to =>"guest@mail.ru", :title => "Title", :text => "Message")
    send.stub(:to) do |arg|
        if arg == "guest@mail.ru"
          send.to = "anybody@mail.ru"
        else
        end
    end
    expect(send.to).to eq("anybody@mail.ru")
  end

  context "send email" do
    before(:each) do
      @send = mock(Send)
      @send.stub!(:sendMessage).and_return("Email Sent successfully....")
    end

    it "#send email return Email Sent successfully" do
      @send.should_receive(:sendMessage).and_return("Email Sent successfully")
      answer = @send.sendMassage
      answer.should match("Email Sent successfully")
    end
  end
end
