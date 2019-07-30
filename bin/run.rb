require_relative '../config/environment'
require_relative '../lib/cli.rb'

#puts "hello world"

puts "Welcome to the Baltimore City Art Portal!"
puts "What would you like to do?" 
puts ""
puts "Create Record"
puts "Update Record" 
puts "Destroy Record"
puts "Retrieve Record" 
puts ""

response = gets.strip 
greeting(response)

# binding.pry
# 0