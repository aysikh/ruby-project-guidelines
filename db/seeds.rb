Bartender.destroy_all
Customer.destroy_all
Drink.destroy_all


################ BARTENDERS #####################
# amy = Bartender.find_or_create_by(name: "Amy", years_of_experience: 5)

# milo = Bartender.find_or_create_by(name: "Milo", years_of_experience: 2)

# steve = Bartender.find_or_create_by(name: "Steve", years_of_experience: 1)


################### WINE ####################
pinotnoir = Drink.find_or_create_by(name: "Pinot Noir", price: 5)

cabernet = Drink.find_or_create_by(name: "Cabernet Sauvignon",price: 7)

pinotgrigrio = Drink.find_or_create_by(name: "Pinot Grigio", price: 7)

reisling = Drink.find_or_create_by(name: "Reisling", price: 5)

################## SELTZER #####################
whiteclaw = Drink.find_or_create_by(name: "White Claw", price: 6)

truly = Drink.find_or_create_by(name: "Truly", price: 6)

################## BEER ##########################
bluemoon = Drink.find_or_create_by(name: "Blue Moon", price: 5)

solace = Drink.find_or_create_by(name: "Solace Lucy Juicy", price: 7)

kirin = Drink.find_or_create_by(name: "Kirin Ichiban", price: 5)

miller = Drink.find_or_create_by(name: "Miller Lite", price: 5)

flyingdog = Drink.find_or_create_by(name: "Flying Dog IPA", price: 7)

modelo = Drink.find_or_create_by(name: "Modelo", price: 6)

################## COCKTAILS ####################
moscowmule = Drink.find_or_create_by(name: "Moscow Mule", price: 10, liquor: "Vodka", ingredients: "Ginger beer and lime juice")

orangecrush = Drink.find_or_create_by(name: "Orange Crush", price: 10, liquor: "Vodka", ingredients: "Orange juice, triple sec, and simple syrup")

mojito = Drink.find_or_create_by(name: "Mojito", price: 8, liquor: "Rum", ingredients: "Simple syrup, mint, and sprite")

oldfashion = Drink.find_or_create_by(name: "Old Fashion", price: 12, liquor: "Whiskey", ingredients: "Angostura bitters, orange bitters, and demerara")

whiterussian = Drink.find_or_create_by(name: "White Russian", price: 12, liquor: "Vodka", ingredients: "Heavy cream and coffee liqueur")

whiskeysour = Drink.find_or_create_by(name: "Whiskey Sour", price: 12, liquor: "Whiskey", ingredients: "Egg white, lemon juice, demerara")

cucumbergin = Drink.find_or_create_by(name: "Cucumber Gin Fizz", price: 12, liquor: "Gin", ingredients: "Cucumber, simple syrup, elderflower liqueur, lime, and egg white")

nysour = Drink.find_or_create_by(name: "New York Sour", price: 12, liquor: "Whiskey", ingredients: "Lemon juice, demerara, and red wine")

tequilasunrise = Drink.find_or_create_by(name: "Tequila Sunrise", price: 10, liquor: "Tequila", ingredients: "Pineapple juice, orange juice, lemon juice, simple syrup and grenadine")

oaxacanfashion = Drink.find_or_create_by(name: "Oaxacan Old Fashion", price: 12, liquor: "Tequila", ingredients: "Chocolate mole bitters and demerara")

virginmojito = Drink.find_or_create_by(name: "Virgin Mojito", price: 6, ingredients: "Mint, simple syrup, and sprite")

virgincrush = Drink.find_or_create_by(name: "Virgin Orange Crush", price: 6, ingredients: "Orange juice, simple syrup, sprite")

################### MISC ########################
water = Drink.find_or_create_by(name: "The Finest Tap Water", price: 0)

soda = Drink.find_or_create_by(name: "Soda", price: 2)


################# CUSTOMERS ###################
sue = Customer.find_or_create_by(name: "Sue", drink: reisling.name, is_over_21: true)

matteo = Customer.find_or_create_by(name: "Matteo", drink: moscowmule.name, is_over_21: true)

shannon = Customer.find_or_create_by(name: "Shannon", drink: orangecrush.name, is_over_21: true)

paul = Customer.find_or_create_by(name: "Paul", drink: mojito.name, is_over_21: true)

mark = Customer.find_or_create_by(name: "Mark", drink: moscowmule.name, is_over_21: true)

# jon = Customer.find_or_create_by(name: "Jon", drink: whiterussian is_over_21: true

# anney = Customer.find_or_create_by(name: "Anney", drink: whiskeysour, is_over_21: true

# conrad = Customer.find_or_create_by(name: "Anney", drink: cucumbergin, is_over_21: true

# michelle = Customer.find_or_create_by(name: "Michelle", drink: oldfashionis_over_21: true)

# stephanie = Customer.find_or_create_by(name: "Stephanie", drink: water, is_over_21: false

# kevin = Customer.find_or_create_by(name: "Kevin", drink: soda is_over_21: false

<<<<<<< HEAD
# zachary = Customer.find_or_create_by(name: "Zachary", drinks: pinotgrigriois_over_21: true
=======
# zachary = Customer.find_or_create_by(name: "Zachary", drink: pinotgrigriois_over_21: true

>>>>>>> 8383c64d72a810d5b887f739b2601f73f9b4586c
