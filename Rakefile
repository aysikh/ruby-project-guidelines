require 'sinatra/activerecord/rake'
require_relative './config/environment'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

desc 'say hello'
task :hello do
  puts "Hello!!"
end

  