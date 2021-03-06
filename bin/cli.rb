require_relative '../config/environment'
require 'colorize'
# require 'audio-playback'
String.modes
# String.color_samples

def welcome

  print "
  (
    *                           )   *
                  )     *      (
        )        (                   (
       (          )     (             )
        )    *           )        )  (
       (                (        (      *
        )          H     )        )
                  [ ]            (
           (  *   |-|       *     )    (
     *      )     |_|        .          )
           (      | |    .  
     )           /   \\     .    ' .        *
    (           |_____|  '  .    .  
     )          | ___ |  \\~~~/  ' .   (
            *   | \\ / |   \\_/  \\~~~/   )
                | _Y_ |    |    \\_/   (
    *           |-----|  __|__   |      *
                `-----`        __|__ 
                \n \n".colorize(:color => :blue, :background => :light_white).bold
  
  print "Welcome to the app. Please enter your name: ".colorize(:color => :blue, :background => :light_white).bold
  username = gets.chomp
  print "Years of experience? ".colorize(:color => :blue, :background => :light_white).bold
  experience = gets.chomp
  new_bartender = Bartender.new(name: username, years_of_experience: experience)
  new_bartender.save
  new_bartender
end

def help(new_bartender)
  puts "Hello #{new_bartender.name}! Are you ready to start bartending?".colorize(:color => :light_blue, :background => :light_white).bold
  puts "\n"
  puts "Enter one of the following: ".colorize(:color => :blue, :background => :light_white).bold
  puts "1. '1' to see a list of available drinks at the bar".colorize(:color => :light_blue, :background => :light_white).bold
  puts "2. '2' to view current customers at the bar".colorize(:color => :blue, :background => :light_white).bold
  puts "3. '3' to create a new customer profile".colorize(:color => :light_blue, :background => :light_white).bold
  puts "4. '4' to create a new drink for the menu".colorize(:color => :blue, :background => :light_white).bold
  puts "5. '5' to add a drink to a customer's tab".colorize(:color => :light_blue, :background => :light_white).bold
  puts "6. '6' to update a customer's profile".colorize(:color => :blue, :background => :light_white).bold
  puts "7. '7' to delete a customer's profile".colorize(:color => :light_blue, :background => :light_white).bold
  puts ""
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
    puts "WOMP WOMP. #{customer_name} is too young for alcohol.".colorize(:color => :red, :background => :light_white).bold
    puts "Enter '1' for water or '2' for soda"
    customer_choice = gets.chomp
    if customer_choice == "1"
      customer_drink = "water"
    elsif  customer_choice == "2"
      customer_drink = "soda"
    else
      puts "Please choose (1) water or (2) soda."
    end
  else
    puts "What is #{customer_name}'s drinking?"
    customer_drink = gets.chomp
  end
  new_customer = Customer.new(name: customer_name, drink: customer_drink, age: customer_age)
  new_customer.save
  puts "Nice! #{customer_name} has been added. ".colorize(:color => :yellow, :background => :light_white).bold
  puts "#{customer_name.upcase} IS READY TO ".colorize(:color => :blue, :background => :light_white)
  print "
   __      ___            ___
  / _   |   |     |    |   | 
  \\__)  |   |     |__  |   |  
  ".colorize(:color => :cyan, :background => :light_white)       
end

def create_new_drink
  puts "What is the name of your drink?"
  drink_name = gets.chomp
  drink_array = all_drinks
  # binding.pry
  if drink_array.include?(drink_name)
    puts "Whoops! #{drink_name} is already on the menu!"
    create_new_drink
  else
    puts "What will be the price for #{drink_name}?"
    drink_price = gets.chomp
    puts "Does #{drink_name} contain liquor? If so, what kind? If not, leave blank."
    drink_liquor = gets.chomp
    puts "Does #{drink_name} comtain any extra ingredients? If so, what kind? If not, leave blank." 
    drink_ingredients = gets.chomp
    new_drink = Drink.new(name: drink_name, price: drink_price, liquor: drink_liquor, ingredients: drink_ingredients)
    new_drink.save
    puts "#{drink_name} has been added to the menu!"
    puts "
     .
      .
     . .
    ...
  \\~~~~~/
   \\   /
    \\ /
     V
     |
     |
    --- ".colorize(:color => :blue)
    puts "DRINK UP!".colorize(:color => :light_blue)
  end
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
  Customer.all.pluck(:name)
end

def all_drinks
  Drink.all.pluck(:name)
end

def update_customer 
  puts "What is the name of the customer you would like to edit?"
  current_name = gets.chomp
  updated = Customer.find_by(name: current_name)
  puts "What would you like to update about #{current_name}?"
  puts "Name, drink, or age?"
  user_choice = gets.chomp
  if user_choice.downcase == "name"
    puts "What is the new name?"
    update_name = gets.chomp
    updated.update(name: update_name)
    puts "#{update_name} has been updated!"
    updated.save
  elsif user_choice.downcase == "age"
    puts "How old is #{current_name} now?"
    update_legal = gets.chomp
    updated.update(age: update_legal)
    updated.save
    puts "HAPPY BIRTHDAY #{current_name.upcase}!!!".colorize(:color => :yellow).bold
  elsif user_choice.downcase == "drink"
    puts "What is #{current_name}'s ordering?"
    update_customer_drink = gets.chomp
    updated.update(drink: update_customer_drink)
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
    delete_customer_row = Customer.find_by(name: delete_customer_name)
    delete_customer_row.delete
    puts "Customer deleted".colorize(:color => :red, :background => :light_white).bold
  elsif delete_input.downcase == "drink"
    puts "What is the name of the drink you would like to delete?"
    delete_drink_name = gets.chomp
    delete_drink_row = Drink.find_by(name: delete_drink_name)
    delete_drink_row.delete
    puts "Drink deleted".colorize(:color => :red, :background => :light_white).bold
      puts "Enter 'help' to return to the main menu." 
  end
end

new_bartender = welcome
help(new_bartender)
usage = true
while usage == true do
  user_input = gets.chomp
  user_input = user_input.downcase
  if user_input == 'exit'
    print "
      ||                            ___                                  
      ||                         .      .                                
      ||      G                 /         \          oOoOo               
      ||                        |         |       ==|||||               
      ||        I               \\       //      _|| |||||               
      ||                           .___.     _.-^|| |||||               
      ||           T            __/_______.-      ==HHHHH               
      ||                   _.-  /                   ~~~~~               
      ||                 -     /    oOoOo                                
      ||                 -_   /  *==|||||                                
      ||        L           - -/_|| |||||                                
      ||                     /  ^|| |||||                                
      ||           I        /     ==HHHHH                               
      ||                   /________~~~~~                                
      ||              T     \\       \\                                  
      ||                     \\       \\   /                             
      ||                      /       \\ /                              
      ||                     /                                           
      ||                    /____                                        
      || 
      \n
      \n".colorize(:yellow)
    
    puts "See you later!".colorize(:color => :yellow, :background => :light_white).bold
    break
  elsif user_input == "1"
    puts all_drinks()
  elsif user_input == "2"
    puts all_customers()
  elsif user_input == "3"
    create_new_customer()
  elsif user_input == "4"
    create_new_drink()
  elsif user_input == "5"
    add_drink()
  elsif user_input == "6"
    update_customer()
  elsif user_input == "7"
    delete()
  elsif user_input == "help"
    help(new_bartender)
  else
    puts "Whoops! Unrecognized command.".colorize(:color => :red, :background => :light_white).bold
    puts "Type 'help' to see list of commands"
  end

end