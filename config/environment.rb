require 'bundler'
Bundler.require
require_all 'lib'
require_all 'app2'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

# set :database, {:adapter =>'sqlite3', :database=>'development.db'}