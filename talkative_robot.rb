require 'pry'
require 'csv'

def author_info
	author = {name: "Liz", age: "32", gender: "female", color: "purple",  spirit_animal: "dog", pet: "yes"}
end

def greeting
	puts "Hello! I'd like to get to know you.  I'll start by asking you some questions."
end

def user_input(user)	
	puts "What's your name?"
	user[:name] = gets.chomp.capitalize

	puts "How old are you?"
	user[:age] = gets.chomp.to_i

	puts "Are you male or female? (type male or female)"
	user[:gender] = gets.chomp.downcase
	user
end

def age_gender_greeting(user)
	gender_greeting = user[:gender] == "female" ? "Ms." : "Mr."
	age_message = user[:age] >= 21 ? "You're old enough to drink! Yes!" : "You're not old enough to drink."
	puts "Hi #{gender_greeting} #{user[:name]} who is #{user[:age]} years old. #{age_message}"
end

def until_75_statement(user)
	case
	when user[:age] < 75
		young_future_age = 75 - user[:age]
		puts "You will be 75 years old in #{young_future_age} years!"
	when user[:age] > 75
		old_future_age = user[:age]- 75
		puts "#{old_future_age} years ago you turned 75! Wow, you're up there!"
	when user[:age] == 75
		puts "You're exactly 75 years old!"
	end
end

def cool_with_first_initial(user)
	first_initial = user[:name].chars.first
	puts "Do you mind if I call you #{first_initial}? (yes or no)"
	initial_answer = gets.chomp.downcase
end

def first_initial_preference(user)
	if cool_with_first_initial(user) == "no" 
		user[:name] = user[:name].chars.first 
		puts "Okay, I'll call you #{user[:name]}."	
	else
		puts "Don't worry about it, I'll call you #{user[:name]}."
	end
end

def whats_up_message(user) 
	user[:name].upcase!
	puts "Hey #{user[:name]}, where are you going!?"
	puts "Yo 'Dude', are you having a good day? (yes or no)"
	whats_up_answer = gets.chomp
	puts whats_up_answer == "yes" ? "That's good news." : "Sorry to hear that."
end

def gather_user_preference
	puts "Now I'd like to gather some other fun information."
end

def user_preference_answers(user)

	puts "What's your favorite color?"
	user[:color] = gets.chomp.upcase

	puts "What is your spirit animal?"
	user[:spirit_animal] = gets.chomp.upcase

	puts "Do you have a pet? (yes or no)"
	user[:pet] = gets.chomp.downcase
	user
end

def spirt_animal_message(user)
	puts "#{user[:name]}, you are now channeling the mighty #{user[:spirit_animal]} whose power color is #{user[:color]}!  You are almost ready to take over the world!!!"
end

def has_pet?(user)
	user[:pet] == "yes"
end

def pet_statement(user)
	puts has_pet?(user) ? "Lucky you. Having a pet makes your spirit animal proud!" : "However, you don't have a pet. :( Your spirit animal is disappointed."
end

def grocery_list
	grocery_list = IO.read("grocery_list.txt").chomp.split(", ")
	grocery_list.map! { |item| item.downcase }
	grocery_list
end

def grocery_items_needed(grocery_list) 
	puts "Time to go to the grocery store. Items to buy:"
	grocery_list.each_index do |i| puts "Item #{ i +1 } -- #{grocery_list[i]}"
	end
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
 	grocery_list
end

def butter_reminder(grocery_list)
 	puts "Oh yeah, don't forget the butter!"
 	grocery_list << "butter"
end

def create_new_txt_grocery_file(groceries_including_butter)
	IO.write("new_grocery_list.txt", groceries_including_butter)
end

def create_csv_grocery_file(groceries_including_butter)
	CSV.open("groceries_including_butter.csv", "w" ) do |csv|
  		csv << ["Item Number", "Item Name"]
  		groceries_including_butter.each_index do |i| 
  			csv << ["#{i+1}", groceries_including_butter[i]]
  		end
  	end
end

def save_grocery_list(groceries_including_butter)
	create_new_txt_grocery_file(groceries_including_butter)
	create_csv_grocery_file(groceries_including_butter)
end

def read_from_csv
	col_data0 = []
	col_data1 = []
	CSV.foreach('groceries_including_butter.csv') {|row| col_data0 << row[0] + " " + row[1]}
	puts "This is the current grocery list:"
	col_data0.shift
	puts col_data0
end

def grocery_stuff
	grocery_items_needed(grocery_list)
	response = grocery_statement(grocery_list)
	updated_grocery_list = grocery_response(response, grocery_list)
	groceries_including_butter = butter_reminder(updated_grocery_list)
	save_grocery_list(groceries_including_butter)
	read_from_csv
end

def return_author(people)
	people.reject{ |person| person[:name] != "Liz" }.first
end

def select_by_name(list_of_users, first_name)
	list_of_people.select{ |person| person[:name] == first_name }.first
end

def salutation(author, people)
	puts "Goodbye!  Authored by: #{author = return_author(people)[:name]}."
end


greeting
user = {}
author = author_info
people = [user, author]
user_input(user)
age_gender_greeting(user)
until_75_statement(user)
first_initial_preference(user)
whats_up_message(user)
gather_user_preference
user_preference_answers(user)
spirt_animal_message(user)
pet_statement(user)
grocery_stuff
salutation(author, people)




