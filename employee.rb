class Employee
#super_class
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss

        @boss.employees << self if @boss != nil
    end

    def bonus(multiplier)
        bonus = (self.salary) * multiplier
        bonus
    end
end

class Manager < Employee
#sub_class
    attr_reader :employees

    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = [] #functionally Employee.boss = manager
    end

    def bonus(multiplier)
        sum = 0 
        self.employees.each do |employee|
            if !employee.is_a?(Manager)
                sum += employee.salary
            else 
                sum += employee.salary + employee.bonus(multiplier)
            end
        end
        sum * multiplier
    end

end

p manager2 = Manager.new("Ned", "Founder", 1000000, nil) #employees
puts "---"
p manager1 = Manager.new("Darren", "TA Manager", 78000, manager2)
puts "---"
p employee1 = Employee.new("David", "TA", 10000, manager1) 
puts "---"
p employee2 = Employee.new("Shawna", "TA", 12000, manager1)

 p manager2.bonus(5) # => 500_000
# p darren.bonus(4) # => 88_000
# p david.bonus(3) # => 30_000


# if employee we just want their salary
# if manager we want their salary and those below him 