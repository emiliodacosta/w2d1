class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = (@salary) * multiplier
  end

end

class Manager < Employee

  def initialize(name, title, salary, boss = nil, subordinates)
    super(name, title, salary, boss = nil)
    @subordinates = subordinates
  end

  def bonus(multiplier)
    sum = 0
    @subordinates.each do |employee|
      sum += employee.salary
    end
    sum * (multiplier)
  end
end

Shawna = Employee.new("Shawna", "TA", 12000, "Darren")
David = Employee.new("David", "TA", 10000, "Darren")
Darren = Manager.new("Darren", "TA Manager", 78000, "Ned", [Shawna, David])
Ned = Manager.new("Ned", "Founder", 1000000, "Darren")

p Shawna.bonus(3)
p Darren.bonus(4)
