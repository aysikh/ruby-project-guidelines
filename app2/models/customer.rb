class Customer < ActiveRecord::Base

  def add_drink
    puts "What is the name of the tab you would like to update?"
    add_tab_name = gets.chomp
    find_person = Customer.find_by name: "#{add_tab_name}"
    puts "What is the name of the drink you would like to add to #{add_tab_name}'s tab?"
    add_tab_drink = gets.chomp
    find_drink = Drink.find_by name: "#{add_tab_drink}"
    puts "You added #{add_tab_drink} to #{add_tab_name}'s tab!"
    new_bar = Bar.new customer_id: "#{find_person.id}", drinks_id: "#{find_drink.id}"
    binding.pry
    new_bar.save
  end

end