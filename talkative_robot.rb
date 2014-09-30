require 'pry'
require 'csv'


def greeting
	puts "Hello! I'd like to get to know you.  I'll start by asking you some questions."
end

class Person
	def initialize(args)
		@name 			= args[:name]
		@age 			= args[:age]
		@gender 		= args[:gender]
		@color 			= args[:color]
		@spirit_animal 	= args[:spirit_animal]
		@pet 			= args[:pet]
	end

	def self.get_info_from_prompts
    	user = {}
    	puts "What is your name? "
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

	def name
		@name
	end

	def user_name
		self.name
	end

	def age
		@age
	end

	def gender
		@gender
	end

	def color
		@color
	end

	def spirit_animal
		@spirit_animal
	end

	def pet
		@pet
	end

	def female?
		@gender == "female"
	end

	def age_gender_greeting
		gender_greeting = female? ? "Ms." : "Mr."
		age_message = @age >= 21 ? "You're old enough to drink! Yes!" : "You're not old enough to drink."
		puts "Hi #{gender_greeting} #{@name} who is #{@age} years old. #{age_message}"
	end

	def until_75_statement
	case
		when @age < 75
			young_future_age = 75 - @age
			puts "You will be 75 years old in #{young_future_age} years!"
		when @age > 75
			old_future_age = @age - 75
			puts "#{old_future_age} years ago you turned 75! Wow, you're up there!"
		when @age == 75
			puts "You're exactly 75 years old!"
		end
	end

	def first_initial
		first_initial = @name.chars.first
	end

	def ask_about_first_initial
		puts "Do you mind if I call you #{first_initial}? (yes or no)"
		@first_initial_answer = gets.chomp.downcase
	end

	def cool_with_first_initial?
		@first_initial_answer == "yes"
	end

	def first_initial_preference
		ask_about_first_initial
		puts cool_with_first_initial? ? "Okay, I'll call you #{@name}." : "Don't worry about it, I'll call you #{@name}."
		if cool_with_first_initial? 
			@name = @name.first_initial
		end
	end

	def whats_up_message
		name_caps = @name.upcase
		puts "Hey #{name_caps}, where are you going!?"
		puts "Yo 'Dude', are you having a good day? (yes or no)"
		whats_up_answer = gets.chomp
		puts whats_up_answer == "yes" ? "That's good news." : "Sorry to hear that."
	end

	def spirit_animal_message
		puts "Whoa! #{@name}, you are now channeling the mighty #{@spirit_animal} whose power color is #{@color}!  You are almost ready to take over the world!!!"
	end

	def has_pet?
		@pet == "yes"
	end

	def pet_statement
		puts has_pet? ? "Lucky you. Having a pet makes your spirit animal proud!" : "However, you don't have a pet. :( Your spirit animal is disappointed."
	end

end

class User < Person
	def initialize(args)
		super
	end
end

class Author < Person
	def initialize(args)
		super
	end

	def self.author_info
	author_inputs = {
		name: "Liz", age: "32", gender: "female", color: "purple", spirit_animal: "dog", pet: "yes"}
	end
end

class Grocery
	def initialize(grocery_list)
		@items = grocery_list
	end

	def items
		@items
	end

	def self.get_list
		@items = IO.read("grocery_list.txt").chomp.split(", ")
		@items.map! { |item| item.downcase }
	end

	def items_needed
		puts "Time to go to the grocery store. Items to buy:"
		@items.each_index do |i| 
			puts "Item i +1 -- #{@items[i]}"
		end
	end

	def random_item
		@random_item ||= @items.sample
	end

	def grab_random_item
 		puts "Did you grab the #{random_item}?"
 		@answer = gets.chomp.downcase
	end

	def random_item_response
 		if @answer == "yes"  
 			puts "Great." 
     		@items.delete(random_item)
 		else 
 			puts "Oh no!"
 		end
 		@items
	end

	def butter_reminder
 		puts "Oh yeah, don't forget the butter!"
 		@items << "butter"
	end

	def create_new_txt(txt_file_name)
		IO.write("new_grocery_list.txt", @items)
	end

	def create_csv(csv_file_name)
		CSV.open(csv_file_name, "w" ) do |csv|
  			csv << ["Item Number", "Item Name"]
  			@items.each_index do |i| 
  				csv << ["#{i+1}", @items[i]]
  			end
  		end
	end

	def save_list(txt_file_name, csv_file_name)
		create_new_txt(txt_file_name)
		create_csv(csv_file_name)
	end

	def read_from_csv
		col_data0 = []
		col_data1 = []
		CSV.foreach('groceries_including_butter.csv') {|row| 
			col_data0 << row[0] + " " + row[1]}
		puts "Okay, here's the updated list:"
		col_data0.shift
		col_data0
		puts col_data0
	end

	def go_shopping(txt_file_name, csv_file_name)
		items_needed
		response = grab_random_item
		random_item_response
		butter_reminder
		save_list(txt_file_name, csv_file_name)
		read_from_csv
	end

end

def select_by_name(person, first_name)
	list_of_people.select{ |person| person[:name] == first_name }.first
end

def salutation(person)
	puts "Goodbye!  Authored by: #{person[:name]}."
end


greeting
@user = User.new(User.get_info_from_prompts)
@user.age_gender_greeting
@user.until_75_statement
@user.first_initial_preference
@user.whats_up_message
@user.spirit_animal_message
@user.pet_statement

items = Grocery.get_list
@items = Grocery.new(items)
@items.go_shopping("new_grocery_list.txt", "groceries_including_butter.csv")

author_info = Author.author_info
@author = Author.new(author_info)
salutation(Author.author_info)

