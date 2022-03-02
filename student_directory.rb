#Puts student data into an array.
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
#Print student array
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each { |student|
    puts student
  }
end

#Print total number of students
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

print_header
print(students)
print_footer(students)