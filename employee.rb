class Employee
#super_class
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

end

class Manager < Employee
#sub_class
    def initialize(name, title, salary, boss)
        @employees = [] #functionally Employee.boss = manager
        @employees << Employee if Employee.boss == self.name
    end

end

employee1 = Employee.new("David", "TA", 10,000, "Darren")
employee2 = Employee.new("Shawna", "TA", 12,000, "Shawna")
employee3 = Employee.new("Daren", "TA Manager", 78,000, "Ned")
employee4 = Employee.new("Ned", "Founder", 1,000,000, nil)