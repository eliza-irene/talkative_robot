require 'pry'


puts "Let's get started.  I'll need your name, age, and gender."
puts "What's your name?"
name = gets.chomp.capitalize

puts "How old are you?"
age = gets.chomp.to_i
puts "You can drive!" if age >= 16

puts "Are you male or female?"
gender = gets.chomp.downcase

gender_greeting = gender == "female" ? "Ms." : "Mr."
age_message = age >= 21 ? "You're old enough to drink! Yes!" : "You're not old enough to drink."
puts "Hi #{gender_greeting} #{name} who is #{age} years old. #{age_message}"

first_initial = name.chars.first
puts "Do you mind if I call you #{first_initial}?"
initial_answer = gets.chomp.downcase
puts initial_answer == "no" ? "Okay." : "Don't worry about it."
			
case
when age < 75
	young_future_age = 75 - age
	puts "You will be 75 years old in #{young_future_age} years!"
when age > 75
	old_future_age = age - 75
	puts "#{old_future_age} years ago you turned 75! Wow, you're up there!"
when age == 75
	puts "You're exactly 75 years old!"
end

name.upcase!
puts "Hey #{name}, where are you going!?"

puts "Yo 'Dude', are you having a good day?"
whats_up = gets.chomp
puts "That's good news." unless whats_up == "no"

puts "What's your favorite color?"
color = gets.chomp.upcase

puts "What is your spirit animal?"
spirit_animal = gets.chomp.upcase

puts "#{name}, you are now channeling the mighty #{spirit_animal} whose power color is #{color}!  You are almost ready to take over the world!!!"

loop do 
puts "Do you have a pet? (yes or no)"
pet = gets.chomp.downcase
if pet == "yes" || pet == "no"
puts pet == "yes" ? "Great! Your spirit animal is proud!" : "I'm sorry. :( Your spirit animal is disappointed."
	break
end
end

		
	