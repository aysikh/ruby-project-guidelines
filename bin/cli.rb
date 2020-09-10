# require_relative '../config/environment'

# ABLE TO CREATE A NEW BARTENDER
print "Welcome to the app. Please enter your name: " 
username = gets.chomp
print "Years of experience? "
experience = gets.chomp
new_bartender = Bartender.new(name: username, years_of_experience: experience)
new_bartender.save

puts "Hello #{new_bartender.name}! Are you ready to start bartending?" 
puts "You can orginize your customers and their drink orders with this aplication."
puts "Type 'menu' to see a list of available drinks at the bar"
puts "Type 'create new customer' to create a new customer profile"
puts "Type 'create new drink' to create a new drink at the bar"
puts "Type 'update customer' to update a customer's profile"
puts "Type 'delete customer' to delete a customer's profile"
puts "or type 'exit' to exit the application"


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
    puts "True or False: Is #{customer_name} over 21?"
    customer_legal = gets.chomp
    puts "What is #{customer_name}'s favorite drink?"
    customer_drink = gets.chomp
    #how to raise error if customer is ordering alcoholic bev.
    new_customer = Customer.new(name: customer_name, favorite_drink: customer_drink, is_over_21: customer_legal)
    new_customer.save
  end

  if user_input.downcase == "create new drink"
    puts "What is the name of your drink?"
    drink_name = gets.chomp
    puts "What will be the price for #{drink_name}?"
    drink_price = gets.chomp
    puts "Does #{drink_name} "
  
  if user_input.downcase == "menu" #print out all the drink names
    print Drink.all.pluck(:name)
  end

  if user_input.downcase == "help"
    print "help"
  end

end

