Bartender.destroy_all
Customer.destroy_all
Drink.destroy_all


################ BARTENDERS #####################
amy = Bartender.find_or_create_by(name: "Amy", years_of_experience: 5)

milo = Bartender.find_or_create_by(name: "Milo", years_of_experience: 2)

steve = Bartender.find_or_create_by(name: "Steve", years_of_experience: 1)


################# CUSTOMERS ###################
sue = Customer.find_or_create_by(name: "Sue", favorite_drink: reisling, favorite_bartender: steve, is_over_21: true, is_a_regular: true)

matteo = Customer.find_or_create_by(name: "Matteo", favorite_drink: moscowmule, favorite_bartender: milo, is_over_21: true, is_a_regular: false)

shannon = Customer.find_or_create_by(name: "Shannon", favorite_drink: orangecrush, favorite_bartender: steve, is_over_21: true, is_a_regular: true)

paul = Customer.find_or_create_by(name: "Paul", favorite_drink: mojito, favorite_bartender: amy, is_over_21: true, is_a_regular: true)

mark = Customer.find_or_create_by(name: "Mark", favorite_drink: moscowmule, favorite_bartender: milo, is_over_21: true, is_a_regular: true)

jon = Customer.find_or_create_by(name: "Jon", favorite_drink: whiterussian, favorite_bartender: milo, is_over_21: true, is_a_regular: true)

anney = Customer.find_or_create_by(name: "Anney", favorite_drink: whiskeysour, favorite_bartender: amy, is_over_21: true, is_a_regular: true)

conrad = Customer.find_or_create_by(name: "Anney", favorite_drink: cucumbergin, favorite_bartender: steve, is_over_21: true, is_a_regular: false)

michelle = Customer.find_or_create_by(name: "Michelle", favorite_drink: oldfashion, favorite_bartender: amy, is_over_21: true, is_a_regular: false)

stephanie = Customer.find_or_create_by(name: "Stephanie", favorite_drink: water, favorite_bartender: steve, is_over_21: false, is_a_regular: true)

kevin = Customer.find_or_create_by(name: "Kevin", favorite_drink: soda, favorite_bartender: milo, is_over_21: false, is_a_regular: false) 

zachary = Customer.find_or_create_by(name: "Zachary", favorite_drink: pinotgrigrio, favorite_bartender: amy, is_over_21: true, is_a_regular: true)


################### WINE ####################
pinotnoir = Drink.find_or_create_by(name: "Pinot Noir", price: 5, fluid_ounce: 8)

cabernet = Drink.find_or_create_by(name: "Cabernet Sauvignon",price: 7, fluid_ounce: 8)

pinotgrigrio = Drink.find_or_create_by(name: "Pinot Grigio", price: 7, fluid_ounce: 8)

reisling = Drink.find_or_create_by(name: "Reisling", price: 5, fluid_ounce: 8)

################## SELTZER #####################
whiteclaw = Drink.find_or_create_by(name: "White Claw", price: 6, fluid_ounce: 12)

truly = Drink.find_or_create_by(name: "Truly", price: 6, fluid_ounce: 12)

################## BEER ##########################
bluemoon = Drink.find_or_create_by(name: "Blue Moon", price: 5, fluid_ounce: 16)

solace = Drink.find_or_create_by(name: "Solace Lucy Juicy", price: 7, fluid_ounce: 16)

kirin = Drink.find_or_create_by(name: "Kirin Ichiban", price: 5, fluid_ounce: 16)

miller = Drink.find_or_create_by(name: "Miller Lite", price: 5, fluid_ounce: 16)

flyingdog = Drink.find_or_create_by(name: "Flying Dog IPA", price: 7, fluid_ounce: 16)

modelo = Drink.find_or_create_by(name: "Modelo", price: 6, fluid_ounce: 16)

################## COCKTAILS ####################
moscowmule = Drink.find_or_create_by(name: "Moscow Mule", price: 10, liquor: "Vodka" ingredients: "Ginger beer and lime juice", fluid_ounce: 12)

orangecrush = Drink.find_or_create_by(name: "Orange Crush", price: 10, liquor: "Vodka", ingredients: "Orange juice, triple sec, and simple syrup", fluid_ounce: 12)

mojito = Drink.find_or_create_by(name: "Mojito", price: 8, liquor: "Rum", ingredients: "Simple syrup, mint, and sprite", inventory: 150, fluid_ounce: 12)

oldfashion = Drink.find_or_create_by(name: "Old Fashion", price: 12, liquor: "Whiskey", ingredients: "Angostura bitters, orange bitters, and demerara", fluid_ounce: 10)

whiterussian = Drink.find_or_create_by(name "White Russian", price: 12, liquor: "Vodka", ingredients: "Heavy cream and coffee liqueur", fluid_ounce: 10)

whiskeysour = Drink.find_or_create_by(name: "Whiskey Sour", price: 12, liquor: "Whiskey", ingredients: "Egg white, lemon juice, demerara", fluid_ounce: 10)

cucumbergin = Drink.find_or_create_by(name: "Cucumber Gin Fizz", price: 12, liquor: "Gin", ingredients: "Cucumber, simple syrup, elderflower liqueur, lime, and egg white", fluid_ounce: 12)

nysour = Drink.find_or_create_by(name: "New York Sour", price: 12, liquor: "Whiskey", ingredients: "Lemon juice, demerara, and red wine", fluid_ounce: 10)

tequilasunrise = Drink.find_or_create_by(name: "Tequila Sunrise", price: 10, liquor: "Tequila", ingredients: "Pineapple juice, orange juice, lemon juice, simple syrup and grenadine", fluid_ounce: 12)

oaxacanfashion = Drink.find_or_create_by(name: "Oaxacan Old Fashion", price: 12, liquor: "Tequila", ingredients: "Chocolate mole bitters and demerara", fluid_ounce: 12)

virginmojito = Drink.find_or_create_by(name: "Virgin Mojito", price: 6, ingredients: "Mint, simple syrup, and sprite", fluid_ounce: 12)

virgincrush = Drink.find_or_create_by(name: "Virgin Orange Crush", price: 6, ingredients: "Orange juice, simple syrup, sprite", fluid_ounce: 12)

################### MISC ########################
water = Drink.find_or_create_by(name: "The Finest Tap Water", price: 0)

soda = Drink.find_or_create_by(name: "Soda", price: 2)

