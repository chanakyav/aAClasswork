class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    self.get_all_employees.sum(&:salary) * multiplier
  end

  def get_all_employees
    subs = []
      @employees.each do |emp|
        if emp.is_a?(Manager)
          subs << emp
          subs += emp.get_all_employees 
        else 
          subs << emp 
        end
      end
    subs
  end

end

if __FILE__ == $PROGRAM_NAME

  ned = Manager.new('Ned', 'Founder', 1000000, nil)
  darren = Manager.new('Darren', 'TA Manager', 78000, ned)
  shawna = Employee.new('Shawna', 'TA', 12000, darren)
  david = Employee.new('David', 'TA', 10000, darren)
  ned.add_employee(darren)
  darren.add_employee(shawna)
  darren.add_employee(david)
  # p ned.employees

  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000

end