require "./employee.rb"
require "./email_reportable.rb"

class Manager < Employee
  attr_accessor :employees
  include EmailReportable

  def initialize(options_hash)
    super
    @employees = options_hash[:employees]
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