

# Шаблон преднозначен для постройки сложных объектов  из нескольких частей
class Computer
  attr_accessor :model, :screen, :cpu, :ram, :memory, :os,
                :str

  def initialize
      @str = []
  end

  def info
    puts "Model #{model}"
    puts "Scren #{screen}"
    puts "CPU #{cpu}"
    puts "RAM #{ram}"
    puts "Memory #{memory}"
    puts "OS #{os}"
  end
end

class ComputerBuilder
  attr_accessor :computer
  def initialize
    @computer = Computer.new
  end

  def set_model(model)
    @computer.model = model
  end

  def set_cpu(cpu)
    @computer.cpu = cpu
  end

  def set_screen(screen)
    @computer.screen = screen
  end

  def set_ram(ram)
    @computer.ram = ram
  end

  def set_memory(memory)
    @computer.memory = memory
  end

  def set_os(os)
    @computer.os = os
  end

  def computer
    obj = @computer.dup
    @computer = Computer.new
    return obj
  end
end



b = ComputerBuilder.new
b.set_model("Apple")
b.set_cpu("2000 Hz")
b.set_screen(22)
b.set_ram(512)
b.set_memory(128)
b.set_os("iOS")

computer = b.computer
computer.info
