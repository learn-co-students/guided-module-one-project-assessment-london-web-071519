require_relative '../config/environment'

 #binding.pry

puts "Welcome to the Baltimore City Art Portal!"	
exit = false
while !exit
    response = do_what
    n_response = to_do(response)
    new_response = next_do(n_response)
    this = next_do(new_response)
    that = next_do(this)
    here = next_do(that)
    there = next_do(here)
end

# loop_from_top
# response = gets.strip 
# greeting(response)