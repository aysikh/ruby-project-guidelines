require_relative '../config/environment'

# ABLE TO CREATE A NEW BARTENDER
print "Welcome to the app. Please enter your name: " 
username = gets.chomp
print "Years of experience? "
experience = gets.chomp
new_bartender = Bartender.new(name: username, years_of_experience: experience)
new_bartender.save

# if user_input.downcase == "back"
#   main_prompt
# end

puts "Hello #{new_bartender.name}! Are you ready to start bartending?"
puts ""
puts "'MENU' to see a list of available drinks at the bar"
puts "'CUSTOMERS' to view current customers at the bar"
puts "'CREATE NEW CUSTOMER' to create a new customer profile"
puts "'CREATE NEW DRINK' to create a new drink at the bar"
puts "'ADD DRINK' to add drink to customer's tab"
puts "'UPDATE CUSTOMER' to update a customer's profile"
puts "'DELETE CUSTOMER' to delete a customer's profile"
puts "'EXIT' to exit the application"
puts "'HELP' to see all of the commands again"



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
    puts "What is #{customer_name}'s drinking?"
    customer_drink = gets.chomp
    # if customer_legal == false
    #   puts "Sorry! #{customer_name} is too young to drink."
    #   customer_drink = "water" || "soda"
    # else 
    #how to raise error if customer is ordering alcoholic bev.
    new_customer = Customer.new(name: customer_name, drink: customer_drink, is_over_21: customer_legal)
    new_customer.save
    puts "Nice! #{customer_name} has been added."
    puts "#{customer_name.upcase} IS READY TO GIT LIT!!!"
  end

  if user_input.downcase == "create new drink"
    puts "What is the name of your drink?"
    drink_name = gets.chomp
    puts "What will be the price for #{drink_name}?"
    drink_price = gets.chomp
    puts "Does #{drink_name} contain liquor? If so, what kind? If not, leave blank."
    drink_liquor = gets.chomp
    puts "Does #{drink_name} comtain any extra ingredients? If so, what kind? If not, leave blank." 
    drink_ingredients = gets.chomp
    new_drink = Drink.new(name: drink_name, price: drink_price, liquor: drink_liquor, ingredients: drink_ingredients)
    new_drink.save
    puts "#{drink_name} has been added to the menu!"
  end

  if user_input.downcase == "add drink"
    puts "What is the customer's name of the tab you would like to update?"
    add_tab_name = gets.chomp
    find_person = Customer.find_by(name: add_tab_name)
    puts "What is the name of the drink you would like to add to #{add_tab_name}'s tab?"
    add_tab_drink = gets.chomp


    find_drink = Drink.find_by(name: add_tab_drink)
    puts "You added #{add_tab_drink} to #{add_tab_name}'s tab!"
    new_bar = Bar.new customer_id: find_person.id, drinks_id: find_drink.id 
    new_bar.save
  end

  if user_input.downcase == "customers" 
    puts Customer.all.pluck(:name)
  end

  if user_input.downcase == "menu"
    puts Drink.all.pluck(:name)
  end

  if user_input.downcase == "update customer" #add drink
    puts "What is the name of the customer you would like to edit?"
    current_name = gets.chomp
    updated = Customer.find_by name: "#{current_name}"
    puts "What would you like to update about #{current_name}?Their name, drink, or age?"
    user_choice = gets.chomp
    if user_choice.downcase == "name"
      puts "What is the new name?"
      update_name = gets.chomp
      updated.update name: "#{update_name}"
      puts "#{update_name} has been updated!"
      updated.save
    elsif user_choice.downcase == "age"
      puts "True or False: is #{current_name} at a legal age to drink?"
      update_legal = gets.chomp
      updated.update is_over_21: "#{update_legal}"
      updated.save
      puts "#{current_name.upcase} IS LEGAL! WOOHOO!"
    elsif user_choice.downcase == "drink"
      puts "What is #{current_name}'s ordering?"
      update_customer_drink = gets.chomp
      updated.update drink: "#{update_customer_drink}"
      updated.save
      puts "#{current_name} has added #{update_customer_drink}to their tab!"
    end
  end

  if user_input.downcase == "delete"
    puts "Would you like to delete a customer or a drink?"
    delete_input = gets.chomp
    if delete_input.downcase == "customer"
      puts "What is the name of the customer you would like to delete?"
      delete_customer_name = gets.chomp
      delete_customer_row = Customer.find_by(name: "#{delete_customer_name}")
      delete_customer_row.delete
      puts "Customer deleted"
    elsif delete_input.downcase == "drink"
      puts "What is the name of the drink you would like to delete?"
      delete_drink_name = gets.chomp
      delete_drink_row = Drink.find_by(name: "#{delete_drink_name}")
      delete_drink_row.delete
      puts "Drink deleted"
    end
  end
end