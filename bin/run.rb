require_relative '../config/environment'

#binding.pry

puts "Welcome to the Baltimore City Art Portal!"	
quit = false
while !quit
    response = do_what
    n_response = to_do(response)
    next_do(n_response)
end
 
 # response = gets.strip 
    # greeting(response)