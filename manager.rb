class Employee
  attr_reader :first_name, :last_name, :salary, :active
  attr_writer :active

  def initialize(options_hash)
    @first_name = options_hash[:first_name]
    @last_name = options_hash[:last_name]
    @salary = options_hash[:salary]
    @active = options_hash[:active]
  end
  
  def print_info
    puts "#{first_name} #{last_name} makes #{@salary} a year."
  end

  def give_annual_raise
    @salary = @salary * 1.05
  end
end

employee1 = Employee.new({first_name: "Peter", last_name: "Jang", salary: 40000, active: true})
employee2 = Employee.new(first_name: "Jay", last_name: "Wengrow", salary: 100000, active: true)

class Manager < Employee
  attr_accessor :employees

  def initialize(options_hash)
    super
    @employees = options_hash[:employees]
  end

  def send_report
    puts "Sending email..."
    # use some email sending library
    puts "Email sent!"
  end

  def give_all_raises
    employees.each do |employee|
      employee.give_annual_raise
    end
  end

  def fire_all_employees
    employees.each do |employee|
      employee.active = false
    end
  end
end

manager = Manager.new(first_name: "Dani", last_name: "Zaghian", salary: 500000, active: true, employees: [employee1, employee2])
# manager.print_info
# manager.send_report
# manager.give_all_raises
# p employee1.salary
# p employee2.salary
manager.fire_all_employees
p employee1.active
p employee2.active