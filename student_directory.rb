@students =[]

#Interactive menu
def print_menu
  puts "Select an option:"
  puts "1. Input students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_student_list
  print_header
  student_footer
end

def user_response(selection)
  case selection
  when "1"
    student_input
  when "2"
    show_student_list
  when "9"
    exit
  else
    "Invalid. Please try again."
  end
end

def interactive_menu
  loop do
    print_menu
    user_response(gets.chomp)
  end
end

#Method for getting student names as user input
def student_input
  puts "Please enter the name of the students, one at a time"
  puts "To finish, hit return twice"
  name_input = gets.chomp
  while !name_input.empty?
    @students.push(name: name_input, cohort: :november)
    puts "Now we have #{@students.count} students"
    name_input = gets.chomp
  end
end

#Print student array
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
  if @students == []
    puts "Student list empty."
  else
    @students.each_with_index { |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]})"
    }
  end
end

def name_beginning_with(letter)
  names_with_initial = []
  @students.each { |student| 
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

def student_footer
  if @students == []
    nil
  elsif @students.count == 1
    puts "We have one great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end


interactive_menu
#name_beginning_with(students, "S")
