### Option Two - Command Line CRUD App
1. We use ActiveRecord to access/create a Sqlite3 Database
2. We have 4 models: bar.rb, bartender.rb, customer.rb, and drink.rb
3. We have a Cli method that runs in a true loop and breaks when the user
inputs 'done'. that method also give the user full CRUD ability to :

    1. create_customer --C
    2. create_drink --C
    3. see all_drinks --R
    4. see all_customers --R
    5. update_customer --U
    6. delete_customer --D
    7. delete_drink --D

4. We use good OO design patterns. there are separate classes for all 4 of
the models. We also have a cli class in the /bin/cli.rb file`


########################################################

Instructions on running /bin/run.rb and using the bartender CRUD app

1. run.rb first welcomes the user (a bartender) and ask for their name and years of experience. This will create a new_bartender instance. and then puts a list of the #bartender methods.

2. A while true loop will start that breaks when the user enters 'exit'.

3. Other than that all CRUD capabilities of out application can be called inside this CLI REPL (cli.rb)