# Represent an employee as an array
# employee1 = ["Peter", "Jang", 40000, true]
# employee2 = ["Jay", "Wengrow", 100000, true]
# puts employee1[0] + " " + employee1[1] + " makes " + employee1[2].to_s + " a year."
# puts "#{employee2[0]} #{employee2[1]} makes #{employee2[2]} a year."

# Represent an employee as an hash
# employee1 = {first_name: "Peter", last_name: "Jang", salary: 40000, active: true}
# employee2 = {:first_name => "Jay", :last_name => "Wengrow", :salary => 100000, :active => true}
# puts "#{employee1[:first_name]} #{employee1[:last_name]} makes #{employee1[:salary]} a year."
# puts "#{employee2[:first_name]} #{employee2[:last_name]} makes #{employee2[:salary]} a year."

# Represent an employee as a class instance
class Employee
  def initialize(input_first_name, input_last_name, input_salary, input_active)
    @first_name = input_first_name
    @last_name = input_last_name
    @salary = input_salary
    @active = input_active
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def active
    @active
  end

  def active=(input_active)
    @active = input_active
  end
  
  def print_info
    puts "#{first_name} #{last_name} makes #{@salary} a year."
  end

  def give_annual_raise
    @salary = @salary * 1.05
  end
end

employee1 = Employee.new("Peter", "Jang", 40000, true)
employee2 = Employee.new("Jay", "Wengrow", 100000, true)
# p employee1
employee1.print_info
employee2.print_info
# puts employee1.give_annual_raise
puts employee1.first_name
puts employee1.last_name
puts employee1.active
puts employee1.active = false
puts employee1.active
