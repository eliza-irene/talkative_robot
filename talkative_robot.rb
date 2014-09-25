require 'pry'

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
	puts cool_with_first_initial?(name) == "yes" ? "Okay." : "Don't worry about it."
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

def grocery_statement(grocery_list) # TO-DO break it up in multiple functions, apply Single-Purpose (define in one sentence, no "and"'s')
	random_grocery_item = grocery_list.sample
	puts "When you were at the grocery store, did you grab the #{random_grocery_item}?"
	answer = gets.chomp.downcase
	return { item: random_grocery_item, answer: answer}
end

def grocery_response(response)
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


greeting
user = user_input

puts "You can drive!" if user[:age] >= 16

gender_greeting(user)
first_initial_response(user[:name])		
age_statement(user[:age])

user[:name].upcase!
puts "Hey #{user[:name]}, where are you going!?"

whats_up_message

puts "#{user[:name]}, you are now channeling the mighty #{user[:spirit_animal]} whose power color is #{user[:color]}!  You are almost ready to take over the world!!!"

pet_statement(user)

grocery_list = ["cheddar cheese", "wine", "croissants", "avacado", "tomato"]


# We're asking the user if they have grabbed an item off the list
# We're removing the item if they have, saying oh no if they haven't

response = grocery_statement(grocery_list)
grocery_response(response)
butter_reminder(grocery_list)
