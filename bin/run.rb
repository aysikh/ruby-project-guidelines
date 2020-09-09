require_relative '../config/environment'

# ABLE TO CREATE A NEW BARTENDER
print "Welcome to the app. Please enter your name: " 
username = gets.chomp
print "Years of experience? "
experience = gets.chomp
new_bartender = Bartender.new(name: username, years_of_experience: experience)
# new_bartender.save

puts "Hello! #{new_bartender.name}. are you ready to start bartending?" 
puts "You can orginize your customers and your drinks with this aplication."
puts "To see a list of basic drinks use the 'Menu' command."
puts "To see all commands use the 'Help' command."

usage = true

  while usage == true do 
    user_input = gets.chomp
  if user_input.downcase == "exit"
    puts "Goodbye!"
    break
  end

  if user_input.downcase == "create new customer"
    puts "What is the customer's name? "
    customer_name = gets.chomp
    puts "True or False: Is the #{customer_name} over 21?"
    customer_legal.downcase = gets.chomp
    puts "What is #{customer_name}'s favorite drink?"
    customer_drink.downcase = gets.chomp
    new_customer = Customer.new(name: customer_name, favorite_drink: customer_drink, is_over_21: customer_legal)

    # new_customer.save
  end
  
  if user_input.downcase == "menu" #print out all the drink names
    print Drink.all.pluck(:name)
  end

  if user_input.downcase == "help"
    print "help"
  end

end

