require_relative '../config/environment'


def welcome
  print "Welcome to the app. Please enter your name: " 
  username = gets.chomp
  print "Years of experience? "
  experience = gets.chomp
  new_bartender = Bartender.new(name: username, years_of_experience: experience)
  new_bartender.save
  new_bartender
end

def help(new_bartender)
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
end

def create_new_customer

  puts "What is the customer's name? "
  customer_name = gets.chomp
  puts "How old is #{customer_name}?"
  customer_age = gets.chomp
  customer_drink = nil
  # binding.pry
  if customer_age.to_i < 21
    puts "#{customer_name} is too young to drink. Are they drinking water or soda?"
    puts "Enter '1' for water or '2' for soda"
    customer_choice = gets.chomp
    if customer_choice == "1"
      customer_drink = "water"
    elsif  customer_choice == "2"
      customer_drink = "soda"
    else
      puts "Please choose (1)water or (2)soda."
    end
  else
    puts "What is #{customer_name}'s drinking?"
    customer_drink = gets.chomp
  end
  new_customer = Customer.new(name: customer_name, drink: customer_drink, age: customer_age)
  new_customer.save
  puts "Nice! #{customer_name} has been added. "
  puts "#{customer_name.upcase} IS READY TO GIT LIT!!!"

end

def create_new_drink
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

def add_drink
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

def all_customers
  puts Customer.all.pluck(:name)
end

def all_drinks
  puts Drink.all.pluck(:name)
end

def update_customer 
  puts "What is the name of the customer you would like to edit?"
  current_name = gets.chomp
  updated = Customer.find_by(name: "#{current_name}")
  puts "What would you like to update about #{current_name}?Their name, drink, or age?"
  user_choice = gets.chomp
  if user_choice.downcase == "name"
    puts "What is the new name?"
    update_name = gets.chomp
    updated.update(name: "#{update_name}")
    puts "#{update_name} has been updated!"
    updated.save
  elsif user_choice.downcase == "age"
    puts "How old is #{current_name} now?"
    update_legal = gets.chomp
    updated.update(age: "#{update_legal}")
    updated.save
    puts "#{current_name.upcase} IS LEGAL! WOOHOO!"
  elsif user_choice.downcase == "drink"
    puts "What is #{current_name}'s ordering?"
    update_customer_drink = gets.chomp
    updated.update(drink: "#{update_customer_drink}")
    updated.save
    puts "#{current_name} has added #{update_customer_drink}to their tab!"
  end
end

def delete
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

new_bartender = welcome
help(new_bartender)
usage = true
while usage == true do
  user_input = gets.chomp
  user_input = user_input.downcase
  if user_input == 'exit'
    puts "Goodbye!"
    break
  elsif user_input == "create new customer"
    create_new_customer()
  elsif user_input == "create new drink"
    create_new_drink()
  elsif user_input == "customers"
    all_customers()
  elsif user_input == "add drink"
    add_drink()
  elsif user_input == "menu"
    menu()
  elsif user_input == "update customer"
    update_customer()
  elsif user_input == "delete"
    delete()
  elsif user_input == "help"
    help(new_bartender)
  else
    puts "Whoops! Unrecognized command. Type 'help' to see list of commands"
  end

end