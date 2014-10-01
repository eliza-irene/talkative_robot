require 'pry'
require 'csv'
require './person'
require './user'
require './author'
require './groceries'


Person.greeting
@user = User.new(User.get_info_from_prompts)
@user.age_gender_greeting
puts @user.age_gender_greeting
@user.until_75_statement
puts @user.until_75_statement
@user.first_initial_preference
@user.whats_up_message
@user.spirit_animal_message
@user.pet_statement

items = Grocery.get_list
@items = Grocery.new(items)
@items.go_shopping("new_grocery_list.txt", "groceries_including_butter.csv")

author_info = Author.author_info
@author = Author.new(author_info)
puts @author.salutation



