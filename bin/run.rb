require_relative '../config/environment'
require_relative '../lib/practiceCLI.rb'


#inding.pry

puts "Welcome to the Baltimore City Art Portal!"	
loop_from_top
response = gets.strip 
greeting(response)
