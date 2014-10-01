class Person
  def initialize(args)
    @name       = args[:name]
    @age      = args[:age]
    @gender     = args[:gender]
    @color      = args[:color]
    @spirit_animal  = args[:spirit_animal]
    @pet      = args[:pet]
  end

  def self.greeting
    puts "Hello! I'd like to get to know you.  I'll start by asking you some questions."
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
    "Hi #{gender_greeting} #{@name} who is #{@age} years old. #{age_message}"
  end

  def until_75_statement
  case
    when @age < 75
      young_future_age = 75 - @age
      "You will be 75 years old in #{young_future_age} years!"
    when @age > 75
      old_future_age = @age - 75
      "#{old_future_age} years ago you turned 75! Wow, you're up there!"
    when @age == 75
      "You're exactly 75 years old!"
    end
  end

  def first_initial
    @name.chars.first
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
    if cool_with_first_initial? 
      puts "Don't worry about it, I'll call you #{@name}." 
    else
      @name = @name.chars.first 
      puts "Okay, I'll call you #{@name}." 
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

  def select_by_name(person, first_name)
  list_of_people.select{ |person| person[:name] == first_name }.first
  end

end