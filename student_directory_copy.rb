#Interactive menu
def print_menu
  puts "Select an option:"
  puts "1. Input students"
  puts "2. Show the students"
  puts "9. Exit"
end

def print_students(students)
  print_header(students)
  student_footer(students)
end

def interactive_menu
  students =[]
  loop do
    print_menu
    user_choice = gets.chomp
    case user_choice
    when "1"
      students = student_input(students)
    when "2"
      print_students(students)
    when "9"
      exit
    else
      "Invalid. Please try again."
    end
  end
end

#Method for getting student names as user input
def student_input(students)
  puts "Please enter the name of the students, one at a time"
  puts "To finish, hit return twice"
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
  students.each_with_index { |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]})"
  }
end

def name_beginning_with(students, letter)
  names_with_initial = []
  students.each { |student| 
  if student[:name][0].upcase == letter.upcase
    names_with_initial.push(student[:name])
  end
  }
  puts "There are #{names_with_initial.count} 
students with a name beginning with #{letter.upcase}. 
These are: "
  names_with_initial.each { |name|
    puts name
  }
end

def student_footer(students)
  puts "Overall, we have #{students.count} great students"
end


interactive_menu
#name_beginning_with(students, "S")
