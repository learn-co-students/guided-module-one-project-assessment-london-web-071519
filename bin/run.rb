require_relative '../config/environment'
require_relative '../lib/practiceCLI.rb'

puts "Welcome to the Baltimore City Art Portal!"	
# puts "What would you like to do?" 	
# puts ""	
# puts "Create Record"	
# puts "Update Record" 	
# puts "Destroy Record"	
# puts "Retrieve Record" 	
# puts ""	

loop_from_top
response = gets.strip 
greeting(response)
# response = gets.strip 
# greeting(response)


# binding.pry
# 0