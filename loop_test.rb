pet = nil

loop do 
puts "Do you have a pet? (yes or no)"
pet = gets.chomp.downcase

if pet == "yes" || pet == "no"


	if pet == "yes"
		puts "Great! Your spirit animal is proud!"
	else pet == "no" 
		puts "I'm sorry. :( Your spirit animal is disappointed."
	end
		break
end
end