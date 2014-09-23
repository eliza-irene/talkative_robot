puts "Do you have a pet?"
pet = gets.chomp.downcase

while not pet == "yes" && pet == "no"

	if pet == "yes"
		puts "Great! Your spirit animal is proud!"
	elsif pet == "no" 
		puts "I'm sorry. :( Your spirit animal is disappointed."
	else
		puts "You didn't answer with 'yes' or 'no'"
	end
end