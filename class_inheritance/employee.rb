class Employee #not sayeef # unemployed #brokeboi #sure
    attr_reader :name, :salary, :title
    attr_accessor :boss

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        self.boss = boss
    end

    def boss=(boss)
        @boss = boss
        boss.add_employee(self) unless boss.nil?
    end

    def bonus(multiplier)
        self.salary * multiplier
    end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, salary, title, boss = nil)
    super(name, salary, title, boss)
    @employees = []
  end

  def add_employee(subordinate)
    employees << subordinate

    subordinate
  end

  def bonus(multiplier)
    self.total_subsalary * multiplier
  end

  protected
  
  def total_subsalary
    total_subsalary = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total_subsalary += employee.salary + employee.total_subsalary
      else
        total_subsalary += employee.salary
      end
    end
    total_subsalary
  end
end


ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000