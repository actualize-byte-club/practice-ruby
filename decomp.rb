# numbers = [
#   [1, 2, 3],
#   [2, 2, 2],
#   [3, 2, 1]
# ]
# # your code goes here
# lines = []
# index = 0
# while index < numbers.length
#   stars = []
#   row = numbers[index]
#   index2 = 0
#   while index2 < row.length
#     stars << "*" * row[index2]
#     index2 = index2 + 1
#   end
#   lines << stars.join(" ")
#   index = index + 1
# end

# numbers.each do |row|
#   stars = []
#   row.each do |number|
#     stars << "*" * number
#   end
#   lines << stars.join(" ")
# end

# lines.each { |line| puts line }

def average(numbers)
  sum = 0
  numbers.each do |number|
    sum += number
  end
  p sum / numbers.length
end

average([2, 4, 1, 6])