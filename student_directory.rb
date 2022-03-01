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
puts "The students of Villains Academy"
puts "-------------"
students.each { |student|
  puts student
}

#Print total number of students
puts "Overall, we have #{students.count} great students"