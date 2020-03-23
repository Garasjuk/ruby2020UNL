require "rspec"
require_relative "../builder"

describe Computer do
  it "add data Computer" do
    computer = Computer.new
    computerBuilder = ComputerBuilder.new
    computerBuilder.set_model("Mac")
    computerBuilder.set_cpu("2000 Hz")
    computerBuilder.set_screen(22)
    computerBuilder.set_ram(512)
    computerBuilder.set_memory(128)
    computerBuilder.set_os("iOS")

    computer = computerBuilder.computer
    computer.model.should include("Mac")
    computer.cpu.should include("2000 Hz")
    computer.screen == 22
    computer.ram == 512
    computer.memory == 128
    computer.os.should include("iOS")
  end
end
