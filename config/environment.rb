require 'bundler'
Bundler.require
require_all 'lib'
require_all 'app2'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
old_logger = ActiveRecord::Base.logger 
ActiveRecord::Base.logger = nil
# set :database, {:adapter =>'sqlite3', :database=>'development.db'}