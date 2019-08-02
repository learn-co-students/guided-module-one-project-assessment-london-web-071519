old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
#To turn it back on:
#ActiveRecord::Base.logger = old_logger

# def loop_from_top
# puts "What would you like to do?" 
# puts ""
# puts "1 Create Record"
# puts "2 Update Record" 
# puts "3 Destroy Record"
# puts "4 Retrieve Record" 
# puts ""
# puts "Exit"
# puts ""
# response = gets.strip 
# greeting(response)
# end 

# def greeting(response)
#     if response == "Create Record" || response == "1"
#         create 
#     elsif response == "Update Record" || response =="2"
#         update 
#     elsif response == "Destroy Record" || response =="3"
#         destroy 
#     elsif response == "Retrieve Record" || response == "4"
#         retrieve
#     elsif response == "Exit" || response == "exit" || response == "esc" 
#         exit
#         response = gets.strip
#         greeting(response)
#     else puts "I'm sorry, hon?"
#         loop_from_top
#     end 
# end 


# def create
#     puts ""
#     puts "What records would you like to create?"
#     puts ""
#     puts "1 Create a new exhibit"
#     puts "2 Purchase a new work"
#     puts ""
#     create_new = gets.strip
#     create_what(create_new)
# end

# def create_loop 
#     puts "Would you like to create a new record?"
#     response = gets.strip 
#         if response == "y" || response == "yes" || response == "please"
#             create
#         else loop_from_top
#     end  
# end

# def create_what(create_new)
#     if create_new == "Create a new exhibit" || create_new == "1"
#         create_record       
#     elsif create_new == "Purchase a new work" || create_new == "2"
#         create_new_work
#     end 
# end 


#  def create_record
#     puts "What artist would you like to feature? Baltimore owns works by the following artists:"
#     Artist.puts_names 
#     puts ""
#     artist = gets.strip
#     puts ""
#         if Artist.names.include?(artist) 
#         # puts "The following works are available to display:" 
#         # works_by_artist(artist) #this only works if the artist has works :(
#         # puts ""
#             puts "At what museum should the exhibit take place?"
#             Museum.all_museums
#             puts ""
#             museum = gets.strip
#             puts "When would you like the exhibit to being? YYYY-DD-MM"
#             start_date_new = gets.strip
#             puts "When would you like the exhibit to end? YYYY-DD-MM"
#             end_date_new = gets.strip
#             Exhibit.create_new(artist, museum, start_date_new, end_date_new)
#             puts "New exhibit planned:"
#             puts ""
#             Exhibit.puts_newest
#                 create_loop
#         else    
#             puts "This artist does not yet appear in our collection!"
#             puts "When was the artist born?"
#             dob = gets.strip
#             puts "When did this artist pass way?"
#             dod = gets.strip
#             Artist.create_new(artist, dob, dod)
#             puts "New artist record:"
#             Artist.puts_newest
#             puts "Now lets create an exhibit!"
#                 create_record     
#     end 
# end 
   
# def create_new_work
#     puts "What is the title of the work?"
#     title_new = gets.strip
#     puts "What is the value of the work?"
#     value_new = gets.strip 
#     puts "In what year was the work created?"
#     year_new = gets.strip 
#     puts "What is the name of the work's artist?"
#     artist = gets.strip 
#     puts ""
#         if Artist.names.include?(artist) 
#             Work.create_new_work(title_new, value_new, year_new, artist)
#             puts "New work:"
#             Work.puts_last 
#                 create_loop
#         else puts "This artist does not yet appear in our collection!"
#             puts "When was the artist born?"
#             dob = gets.strip
#             puts "When did the artist pass away? If still alive, please enter nil."
#             dod = gets.strip
#             Artist.create_new(artist, dob, dod)
#             puts "New artist record:"
#             Artist.puts_newest
#             puts ""
#             puts "Now lets add the work to the database!"
#                 create_new_work
#     end  
# end

# def update
#     puts ""
#     puts "What records would you like to update?"
#     puts ""
#     puts "1 The date of death for an artist"
#     puts "2 The value of a work"
#     puts ""
#     update_new = gets.strip
#     update_and_send(update_new) 
# end 

# def update_and_send(update_new)
#     if update_new == "The value of a work" || update_new == "2"
#         update_value
#     elsif update_new == "The date of death for an artist" || update_new == "1"
#         update_dod
#     else 
#         update_loop
#     end 
# end 

# def update_loop
#     puts "Would you like to update a new record?"
#     response = gets.strip 
#         if response == "y" || response == "yes" || response == "please"
#             update
#         else 
#             loop_from_top
#     end  
# end
        
# def update_value
#     puts "Please provide the title of the work you would like to re-value?"
#     Work.all_titles 
#     puts ""
#     work = gets.strip 
#         if Work.titles.include?(work)
#             puts "What is the new value?"
#             new_value = gets.strip
#             work_to_update = Work.all.find_by_title(work)
#             work_to_update.value = new_value
#             work_to_update.save
#             puts "This record has been updated"
#                 update_loop
#         else puts "It looks like that work isn't in our collection? Would you like to add it?"
#             response = gets.strip 
#         if response == "y" || response == "yes" || response == "please"
#             create_new_work
#         else 
#             update_loop
#         end  
#     end 
# end 

# def update_dod 
#     puts "Which artist would you like to update?"
#     puts ""
#     Artist.puts_names
#     puts ""
#     name_artist = gets.strip 
#     puts "What is the artist's year of death?"
#     new_dod = gets.strip 
#     passed = Artist.all.find_by_name(name_artist)
#     passed.dod = new_dod
#     passed.save 
#     puts "This record has been updated"
#         update_loop
# end 

# def destroy
#     puts ""
#     puts "1 Destroy Forgery"
#     puts "2 Sell Work"
#     puts ""
#     destroy_new = gets.strip
#     destroy_record(destroy_new)
# end 

# def destroy_record(destroy_new)
#     if destroy_new == "Destroy Forgery" || destroy_new == "1"
#         forgery_destroy 
#     else destroy_new == "Sell Work" || destroy_new == "2"
#         forgery_destroy
#     end 
# end

# def forgery_destroy
#     puts "What is the title of the work you would like to sell or destroy?"
#     Work.all_titles
#     puts ""
#     fake = gets.strip
#     fake_work = Work.all.find_by_title(fake)
#     fake_work.destroy
#     puts ""
#     puts "This work has been removed from the database."
#     puts "Would you like to remove a new record?"
#     response = gets.strip 
#         if response == "y" || response == "yes" || response == "please"
#             destroy
#         else loop_from_top
#     end  
# end 

# def retrieve
#     puts ""
#     puts "What records would you like to retrieve?"
#     puts ""
#     puts "1 The names of the artists represented in Baltimore's collection"
#     puts "2 The most valuable work in Baltimore's collection"
#     puts "3 Check at which museums an artist has been featured"
#     puts "4 All works created within a specified period"
#     puts "5 Check if an artist has been featured in an exhibit in the database"
#     puts "6 Select a random work to feature" 
#     puts ""
#     retrieve_this = gets.strip
#     retrieve_options(retrieve_this)
# end 

# def retrieve_loop 
#     puts "Would you like to retrieve a new record?"
#     response = gets.strip 
#     if response == "y" || response == "yes" || response == "please"
#         retrieve
#     else 
#         loop_from_top
#     end  
# end

# def retrieve_options(retrieve_this)
#     if retrieve_this == "The names of the artists represented in Baltimore's collection" || retrieve_this == "1"
#         all_artists
#     elsif retrieve_this == "The most valuable work in Baltimore" || retrieve_this == "2"
#         most_valuable
#     elsif retrieve_this == "Check at which museums an artist has been featured" || retrieve_this == "3"
#         exhibit_by_artist_museum
#     elsif retrieve_this == "All works created within a specified period" || retrieve_this == "4"
#         work_by_period 
#     elsif retrieve_this == "Check if an artist has been featured in an exhibit in the database" || retrieve_this == "5"
#         exhibit_by_artist
#     else retrieve_this == "Select a random work to feature" || retrieve_this == "6"
#         randomly_select
#     end
# end 

# def exhibit_by_artist
#     puts "What artist would you like to check if they have been featured in an exhibit in the database?"
#     Artist.puts_names 
#     puts ""
#     artist_name = gets.strip 
#         if Exhibit.all.find_by_artist_id(Artist.all.find_by_name(artist_name).id) == nil
#             puts "This artist has not been recently featured in an exhibit."
#                 create_loop
#         else
#             puts "This artist has been recently featured in an exhibit."
#                 retrieve_loop    
#     end 
# end

# def exhibit_by_artist_museum 
#     puts "Which artist was featured in the exhibit?"
#     Artist.puts_names 
#     puts ""
#     artist = gets.strip
#     artist_exhibit_museums(artist)
# end 


# def artist_exhibit_museums(artist)
#     if Exhibit.all.find_by_artist_id(Artist.all.find_by_name(artist).id) == nil
#         puts "This artist has not been recently featured in an exhibit."
#             create_loop
#     else 
#         exhibits = Artist.all.find_by_name(artist).exhibits
#         exhibits.each do |exhibit| 
#         puts "The artist was been featured in an exhibit at the following museum:"
#         puts exhibit.museum.name
#             retrieve_loop
#         end  
#     end 
# end 

# def all_artists
#     Artist.puts_names
#     puts ""
#     retrieve_loop
# end 


# def work_by_period
#     puts "What period are you interested in learning about?"
#     puts "Please provide a year to start our search!"
#     year = gets.strip
#     puts "Check out the below works in Baltimore you can see!"
#     Work.by_period(year)
#     puts ""
#         retrieve_loop
# end 

# def randomly_select
#     puts "Why not feature this treasure!"
#         randomly_select_work
#     puts ""
#         retrieve_loop
# end 

# def Artist.puts_names 
#     puts Artist.names
# end 

# def Exhibit.all_end_date
#     Exhibit.all.each {|exhibit| puts exhibit.end_date }
# end 

# def Exhibit.puts_newest 
#     puts Exhibit.newest.artist.name 
#     puts Exhibit.newest.museum.name 
#     puts Exhibit.newest.start_date
#     puts Exhibit.newest.end_date
# end 

# def Artist.puts_newest
#     puts Artist.newest.name
#     puts Artist.newest.dob
#     puts Artist.newest.dod 
# end 

# def Artist.put_works(artist)
#     works = Artist.works_by_artist(artist)
#     works.each {|work| puts work.title}
# end 

# def Museum.all_museums 
#     Museum.all.each {|museum| puts museum.name}
# end 

# def most_valuable
#     puts ""
#     work = Work.most_valuable
#     puts work.title 
#     puts work.value 
#     puts work.year 
#     puts work.artist.name
#     retrieve_loop
# end 

# def Work.all_titles 
#     Work.all.each {|work| puts work.title}
# end 

# def randomly_select_work
#     work = Work.randomly_select
#     puts ""
#     puts work.title
#     puts work.value
#     puts work.year
#     puts work.artist.name
# end 

# def Work.puts_last
#     work = Work.last
#     puts work.title
#     puts work.value
#     puts work.year 
#     puts work.artist.name 
# end 