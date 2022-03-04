@students =[]

#Interactive menu
def print_menu
  puts "Select an option:"
  puts "1. Input students"
  puts "2. Show the students"
  puts "3. Save student data"
  puts "4. Load student data"
  puts "5. Get students with name beginning with letter ?"
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
  when "3"
    save_students
  when "4"
    load_students
  when "5"
    name_beginning_with
  when "9"
    exit
  else
    "Invalid. Please try again."
  end
end

def save_students
  file = File.open("student_data.csv", "w")
  @students.each { |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  } 
end

def load_students
  file = File.open("student_data.csv", "r")
  file.readlines.each { |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  }
  file.close
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

def name_beginning_with
  print "Please enter the letter you wish to search by: "
  letter = gets.chomp
  names_with_initial = []
  @students.each { |student| 
    if student[:name][0].upcase == letter.upcase
      names_with_initial.push(student)
    end
  }
  puts "There are #{names_with_initial.count} students with a name beginning with #{letter.upcase}. 
These are: "
  names_with_initial.each { |student|
    puts"#{student[:name]} (#{student[:cohort]})"
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
