require_relative '../config/environment'

 #binding.pry

puts "Welcome to the Baltimore City Art Portal!"	
exit = false
while !exit
    response = do_what
    n_response = to_do(response)
    next_do(n_response)
end

#loop_from_top
#response = gets.strip 
#greeting(response)