require "pstore"
require "tty-table"
require "./employee.rb"

database = PStore.new("employees.store")

while true
  system "clear"
  database.transaction do
    ids = database.roots
    puts "EMPLOYEES (#{ids.length} total)"
    # ids.each do |id|
    #   employee = database[id]
    #   puts "#{id}: #{employee.first_name} #{employee.last_name} #{employee.salary} #{employee.active}"
    # end
    header = ["id", "first_name", "last_name", "salary", "active"]
    rows = ids.map { |id| [id, database[id].first_name, database[id].last_name, database[id].salary, database[id].active] }
    table = TTY::Table.new header, rows
    puts table.render(:unicode)
  end
  puts
  print "[C]reate [R]ead [U]pdate [D]elete [Q]uit: "
  input_choice = gets.chomp.downcase
  if input_choice == "c"
    print "First name: "
    input_first_name = gets.chomp
    print "Last name: "
    input_last_name = gets.chomp
    print "Salary: "
    input_salary = gets.chomp.to_i
    employee = Employee.new(
      first_name: input_first_name,
      last_name: input_last_name,
      salary: input_salary,
      active: true,
    )
    database.transaction do
      ids = database.roots
      new_id = ids.max.to_i + 1
      database[new_id] = employee
    end
  elsif input_choice == "r"
    print "Employee id: "
    input_id = gets.chomp.to_i
    database.transaction do
      employee = database[input_id]
      pp employee
      puts
      print "Press enter to continue"
      gets.chomp
    end
  elsif input_choice == "u"
    print "Employee id: "
    input_id = gets.chomp.to_i
    database.transaction do
      employee = database[input_id]
      print "Update active status (#{employee.active}): "
      input_active = gets.chomp
      if input_active == "true"
        input_active = true
      elsif input_active == "false"
        input_active = false
      else
        input_active = nil
      end
      employee.active = input_active
      database[input_id] = employee
    end
  elsif input_choice == "d"
    puts "Delete employee"
    print "Enter employee id: "
    input_id = gets.chomp.to_i
    database.transaction do
      database.delete(input_id)
    end
  elsif input_choice == "q"
    puts "Goodbye!"
    return
  else
    puts "Invalid choice"
    print "Press enter to continue"
    gets.chomp
  end
end