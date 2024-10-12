class Mediator
  def initialize
    @components = []
  end

  def add_component(component)
    @components << component
    component.mediator = self
  end

  def notify(sender, event)
    @components.each do |component|
      next if component == sender
      component.receive(event)
    end
  end
end

class Component
  attr_accessor :mediator

  def initialize(name)
    @name = name
  end

  def send(event)
    puts "#{@name} відправляє повідомлення: #{event}"
    @mediator.notify(self, event)
  end

  def receive(event)
    puts "#{@name} отримав повідомлення: #{event}"
  end
end

mediator = Mediator.new

component1 = Component.new("Компонент 1")
component2 = Component.new("Компонент 2")
component3 = Component.new("Компонент 3")
component4 = Component.new("Компонент 4")

mediator.add_component(component1)
mediator.add_component(component2)
mediator.add_component(component3)
mediator.add_component(component4)

component3.send("Привіт, Кс31!") 


