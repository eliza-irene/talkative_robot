require 'pry'

puts "Howdy!!"

puts "What's your name?"
name = gets.chomp.capitalize

puts "How old are you?"
age = gets.chomp.to_i

puts "Hi #{name} who is #{age} years old!"

first_initial = name.chars.first

puts "Do you mind if I call you #{first_initial}?"
initial_answer = gets.chomp.downcase
	if initial_answer == "no"
		puts "Well that's strange! I'm going to call you by your full name anyway."
	elsif initial_answer == "yes"
		puts "Don't worry, I don't like it either."
	else 
		puts "You didn't answer with yes or no."
	end
		
future_age = 75 - age
puts "You will be 75 years old in #{future_age} years."

name.upcase!
puts "Hey #{name}, where are you going!?"

puts "Yo 'Dude', what's up?"
whats_up = gets.chomp

puts "Really?  Your answer is #{whats_up}?!"

puts "What's your favorite color?"
color = gets.chomp.upcase

puts "What is your spirit animal?"
spirit_animal = gets.chomp.upcase

puts "#{name}, you have now become the mighty #{spirit_animal} whose power color is #{color}!  You are almost ready to take over the world!!!"

puts "Do you have a pet?"
pet = gets.chomp.downcase

	if pet == "yes"
		puts "Great! Your spirit animal is proud!"
	elsif pet == "no" 
		puts "I'm sorry. :( Your spirit animal is disappointed."
	else
		puts "You didn't answer with 'yes' or 'no'"
	end