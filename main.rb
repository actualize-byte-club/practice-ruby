require "./manager.rb"
require "./intern.rb"

employee1 = Actualize::Employee.new({first_name: "Peter", last_name: "Jang", salary: 40000, active: true})
employee2 = Actualize::Employee.new(first_name: "Jay", last_name: "Wengrow", salary: 100000, active: true)
# p employee1
employee1.print_info
employee2.print_info
# # puts employee1.give_annual_raise

manager = Actualize::Manager.new(first_name: "Dani", last_name: "Zaghian", salary: 500000, active: true, employees: [employee1, employee2])
manager.print_info
manager.fire_all_employees
p employee1.active
p employee2.active

intern = Actualize::Intern.new(first_name: "Jack", last_name: "Whisler", salary: 10000, active: true)
intern.print_info
intern.send_report