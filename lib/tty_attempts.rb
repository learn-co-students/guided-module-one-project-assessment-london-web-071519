# require "tty-prompt"
# require "pry"

# prompt = TTY::Prompt.new


#  def loop_from_top(prompt)
#     options = [
#         {"Create Record" => -> do 1+1 end},
#         {"Update Record" => -> do update end},
#         {"Destroy Record" => -> do destroy end},
#         {"Retrieve Record" => -> do retrieve end}
#     ]
#     prompt.select("What would you like to do?", options)
# end 
     
# # name = "mary"
# # name = prompt.ask("What is the artist name?", value: name) do |q|
# #     q.required true
# #     q.validate /\A\w+\Z/
# #     q.modify   :capitalize
# # end
# stuff = loop_from_top(prompt)

#  Artist.create(name: name)  
# # binding.pry
# # 0


