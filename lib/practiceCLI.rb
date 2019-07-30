#!/usr/bin/env ruby per https://learn.co/tracks/bootcamp-prep/ruby-fundamentals/command-line-applications/cli-applications-in-ruby 
# ruby bin/< your file name >
# $ chmod +x <file_name>

#Create an Exhibit (what artist, what museum - list them all?)
#Purchase a Work (by which artist? create new artist and painting? from painting class Artist.new)
#Update Records 
#Delete Records eg Destroy a Work, sell a work  
#End Exhibit (?)
#Retrieve Information about exhibits, artistis, paintings 

def loop_from_top
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
end 

#require 

def greeting(response)
    if response == "Create Record"
        create 
    elsif response == "Update Record"
        update 
    elsif response == "Destroy Record"
        destroy 
    elsif response == "Retrieve Record"
        retrieve
    elsif response == "Exit" || response == "exit" || response == "esc" 
        exit_loop
    else puts "I'm sorry, what would you like to do, hon?"
        puts ""
        response = gets.strip
        greeting(response)
    end 
end 

def exit_loop
   # puts ""
end 

def create
    puts ""
    puts "What records would you like to create?"
    puts ""
    puts "Create a new exhibit"
    puts ""
    puts "Purchase a new work"
    puts ""
    create_new = gets.strip
    create_what(create_new)
    #options - add painting, add artist (empty array of works) create exhibit, add museum, create message for exhibit  
end 

def create_what(create_new)
    if create_new == "Create a new exhibit"
        create_record       
    elsif create_new == "Purchase a new work"
        create_new_work
    end 
end 
#create_new
#create(create_new)

 def create_record
        puts "What artist would you like to feature?"
        artist = gets.strip
        puts "What museum would you like to highlight?"
        museum = gets.strip
        puts "When would you like the exhibit to being? (defaults to today)"
        start_date_new = gets.strip
        puts "When would you like the exhibit to end?"
        end_date_new = gets.strip
        Exhibit.create(artist_id: Artist.all.find_by_name(artist).id, museum_id: Museum.all.find_by_name(museum).id, start_date: start_date_new, end_date: end_date_new)
        loop_from_top
    end 
   
    def create_new_work
        puts "What is the title of the work?"
        title_new = gets.strip
        puts "What is the value of the work?"
        value_new = gets.strip 
        puts "When was the work created?"
        year_new = gets.strip 
        puts "Who is the artist?"
        artist = gets.strip 
         if !(Artist.names.include?(artist))
        puts "This artist does not yet appear in our collection!"
        puts "When was the artist born?"
        dob = gets.strip
        puts "Has this artist passed away? If so, when?"
        dod = gets.strip
        new_artist = Artist.create(name: artist, dob: dob, dod: dod)
        Work.create(title: title_new, value: value_new, year: year_new, artist_id: new_artist.id)
        loop_from_top
        else 
           Work.create(title: title_new, value: value_new, year: year_new, artist_id: Artist.all.find_by_name(artist).id)
           loop_from_top
        end  
end

def update
    puts ""
    puts "What records would you like to update?"
    puts ""
    puts "The message for an exhibit"
    puts "The date of death for an artist"
    puts "The value of a work"
    puts "The end date for an exhibit"
    puts ""
    update_new = gets.strip
    update_and_send(update_new)
#options - update message for exhibit, update artist dod, update a work's value, update end of exhibit- extend run  
end 

def update_and_send(update_new)
    if update_new == "The message for an exhibit"
        update_message
    elsif update_new == "The value of a work"
        update_value
    elsif update_new == "The date of death for an artist"
        update_dod
        elsif update_new == "The end date for an exhibit"
            update_end_date
        end 
end 

# def update_message figure out how to add a message :)
#     if update_new == "The message for an exhibit"
#         puts "What exhibit would you like to update? Please provide the:"
#         puts "artist"
#         artist = gets.strip 
#         puts "museum"
#         museum = gets.strip

#     end 

     def update_value
            puts "Please provide the title of the work"
             work = gets.strip 
        if Work.titles.include?(work)
            puts "What is the new value?"
            new_value = gets.strip
             work_to_update = Work.all.find_by_title(work)
             work_to_update.value = new_value
             work_to_update.save
             loop_from_top
        else 
            puts "It looks like that work isn't in our collection? Would you like to add it?"
            response = gets.strip 
            if response == "y" || response == "yes" || response == "please"
                create_new_work
            else 
                loop_from_top
         end  
    end 
end 

    def update_dod 
        puts "What is the name of the artist?"
        name_artist = gets.strip 
        puts "What is the artist's year of death?"
        new_dod = gets.strip 
        passed = Artist.all.find_by_name(name_artist)
        passed.dod = new_dod
        passed.save 
        loop_from_top
    end 

    # def update_end_date -- this isnt working
    #     puts "What exhibit would you like to update? Please provide the:"
    #     puts "Artist Name"
    #     artist = gets.strip 
    #     puts "End Date"
    #     new_end_date = gets.strip
    #     if Exhibit.find_exhibit(artist) && Exhibit.find_exhibit(new_end_date) 

    #         to_update = 
    #         to_update.end_date = new_end_date
    #         #binding.pry
    #     else 
    #         puts "I dont see the requested exhibit, would you like to create a new exhibit?"
    #         response = gets.strip 
    #         if response == "y" || response == "yes" || response == "please"
    #             create_record
    #         else 
    #             loop_from_top
    #         end 
    #     end 
    # end 


 def retrieve
     puts "What records would you like to retrieve?"
     puts ""
     puts "The Artists represented in Baltimore"
     puts "The Museums"
     puts "All works owned by the city"
     puts "The most valuable work in Baltimore"
     puts "All works that have appeared in a specific museum"
     puts "All works created within a specified period"
     puts "Select a random work to feature on the website" 
     puts ""
     retrieve_new = gets.strip
     retrieval_options(retrieve_new)
 end 

 def retrieval_options(retrieve_new)
        if retrieve_new == "The Artists represented in Baltimore"
            all_artists
        elsif retrieve_new == "The most valuable work in Baltimore"
            most_valuable
        # else retrieve_new == "Select random"
        #     Work.randomly_select
        end 
 end 

 def all_artists
    Artist.all
 end 

 def most_valuable
    Work.most_valuable_work
 end 

# #options - all the artists, all the museums, all the exhibits, all the works 
# #options - museums 
#     #all the messages used at the museum 
#     #all the paintings which have appeared at the musuem 
#     #name 

# #options - exhibits 
#     #all the works in a given exhibit 
#     #start date
#     #end date
#     #musuem 
#     #artist 

# #options - artists 
#     #date of birth 
#     #date of death 
#     #works 
#     #name 
#     #artist with most works in Bmore 
#     #which artists have appeared in exhibits 
#     #which artists have not appeared in exhibits 

# #options - works
#     #price of work 
#     #date of creation 
#     #most valuable painting in collection 
#     #title
#     #artist 
#     #find random work to promote on website 
#     #all works created within a 20-year window of a specific year 
# end 

def destroy
        puts ""
        puts "Destroy forgery"
        puts ""

#options - destroy a painting if a forgery or if its sold, destroy an exhibit if it ends, 
# destroy a museum if it burns down b/c shit happens 

end 

 #for entire method