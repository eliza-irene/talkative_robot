require 'pry'

def author_info
	author = {name: "Liz", age: "32", gender: "female", color: "purple",  spirit_animal: "dog", pet: "yes"}
end

def greeting
 	puts "Let's get started.  I'll need to gather some information from you.  Please answer the following questions."
end

def user_input
	user = {}
 	puts "What's your name?"
 	user[:name] = gets.chomp.capitalize

 	puts "How old are you?"
 	user[:age] = gets.chomp.to_i

 	puts "Are you male or female? (type male or female)"
 	user[:gender] = gets.chomp.downcase

 	puts "What's your favorite color?"
 	user[:color] = gets.chomp.upcase

 	puts "What is your spirit animal?"
  	user[:spirit_animal] = gets.chomp.upcase

 	puts "Do you have a pet? (yes or no)"
 	user[:pet] = gets.chomp.downcase
	
 	user
end

def age_statement(age)
 	case
 	when age < 75
 		young_future_age = 75 - age
 		puts "You will be 75 years old in #{young_future_age} years!"
 	when age	 > 75
 		old_future_age = age - 75
 		puts "#{old_future_age} years ago you turned 75! Wow, you're up there!"
 	when age 	== 75
 		puts "You're exactly 75 years old!"
 	end
end

def gender_greeting(user)
 	gender_greeting = user[:gender] == "female" ? "Ms." : "Mr."
 	age_message = user[:age] >= 21 ? "You're old enough to drink! Yes!" : "You're not old enough to drink."
 	puts "Hi #{gender_greeting} #{user[:name]} who is #{user[:age]} years old. #{age_message}"
end

def cool_with_first_initial?(name)
 	first_initial = name.chars.first
 	puts "Do you mind if I call you #{first_initial}? (yes or no)"
 	initial_answer = gets.chomp.downcase
end

def first_initial_response(name)
 	puts cool_with_first_initial?(name) == "no" ? "Okay." : "Don't worry about it."
end

def whats_up_message
 	puts "Yo 'Dude', are you having a good day? (yes or no)"
 	whats_up = gets.chomp
 	puts whats_up == "yes" ? "That's good news." : "Sorry to hear that."
end

def pet_statement(user)
 	puts has_pet?(user) ? "You have a pet! Your spirit animal is proud!" : "You don't have a pet. :( Your spirit animal is disappointed."
end

def has_pet?(user)
 	user[:pet] == "yes"
end

def grocery_items_needed(grocery_list) #map
	puts "Time to go to the grocery store. Items to buy:"
	grocery_list.each {|item| puts "Item #{grocery_list.index(item)+1} -- #{item}"}
end

def grocery_statement(grocery_list) 
 	random_grocery_item = grocery_list.sample
 	puts "Did you grab the #{random_grocery_item}?"
 	answer = gets.chomp.downcase
 	return { item: random_grocery_item, answer: answer}
end

def grocery_response(response, grocery_list)
 	item = response[:item]
 	answer = response[:answer]	
 	if answer == "yes"  
 		puts "Great." 
     	grocery_list.delete(item) 
 	else 
 		puts "Oh no!"
 	end
end

def butter_reminder(grocery_list)
 	puts "Oh yeah, don't forget the butter!"
 	grocery_list << "butter"
end

def grocery_statements(grocery_list)
 	grocery_statement
 	butter_reminder
end

def return_author(people)
	people.reject{|person| person[:name] != "Liz"}[0]
end


greeting
user = user_input
author = author_info
people = [user, author]

puts "You can drive!" if user[:age] >= 16

gender_greeting(user)
first_initial_response(user[:name])		
age_statement(user[:age])

user[:name].upcase!
puts "Hey #{user[:name]}, where are you going!?"

whats_up_message

puts "#{user[:name]}, you are now channeling the mighty #{user[:spirit_animal]} whose power color is #{user[:color]}!  You are almost ready to take over the world!!!"

pet_statement(user)

grocery_list = ["cheddar cheese", "wine", "croissants", "avocado", "tomato"]

grocery_items_needed(grocery_list)
response = grocery_statement(grocery_list)
grocery_response(response, grocery_list)
groceries_including_butter = butter_reminder(grocery_list)

puts "Goodbye!  Authored by: #{return_author(people)[:name]}."
