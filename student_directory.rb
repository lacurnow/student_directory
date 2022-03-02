#Method for getting student names as user input
def student_input
  puts "Please enter the name of the students, one at a time"
  puts "To finish, hit return twice"
  students = []
  name_input = gets.chomp
  while !name_input.empty?
    students.push(name: name_input, cohort: :november)
    puts "Now we have #{students.count} students"
    name_input = gets.chomp
  end
  return students 
end

#Print student array
def print_header(students)
  puts "The students of Villains Academy"
  puts "-------------"
  students.each { |student|
  puts "#{student[:name]} (#{student[:cohort]})" 
  }
end

def student_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = student_input
print_header(students)
student_footer(students)
