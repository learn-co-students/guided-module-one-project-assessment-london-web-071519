#!/usr/bin/env ruby per https://learn.co/tracks/bootcamp-prep/ruby-fundamentals/command-line-applications/cli-applications-in-ruby 
# ruby bin/< your file name >
# $ chmod +x <file_name>

#Create an Exhibit (what artist, what museum - list them all?)
#Purchase a Work (by which artist? create new artist and painting? from painting class Artist.new)
#Update Records 
#Delete Records eg Destroy a Work, sell a work  
#End Exhibit (?)
#Retrieve Information about exhibits, artistis, paintings 

# puts "hello world"



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
    else puts "I'm sorry, what would you like to do, hon?"
        response = gets.strip
        greeting(response)
    end 



    #     puts ""
    #     puts "What records would you like to create?"
    #     puts ""
    #     puts "Plan a new exhibit"
    #     puts "with artist"
    #    # artist = response.gets
    #     puts "in museum :"
    #    # museum = response
    #    # Exhibit.new(artist, museum)
    #     puts ""
    #     puts "Purchase a painting"
    #     puts ""
    # elsif 
    #     response == "Update Record"
    #     puts ""
    #     puts "What records would you like to update?"
    #     puts ""
    #     puts "Update a work's value"
    #     puts ""
    #     puts ""
    # elsif 
    #     response == "Destroy Record"
    #     puts ""
    #     puts "Destroy forgery"
    #     puts ""
    # elsif 
    #     response == "Retrieve Record"
    # else puts "I'm sorry, what would you like to do, hon?"
    # end 
end 

def create
    puts ""
    puts "What records would you like to create?"
    puts ""
    puts "Plan a new exhibit"
    puts "with artist:"
   # artist = response.gets
    puts "in museum :"
    #museum = response
   # Exhibit.new(artist, museum)
    puts ""
    puts "Purchase a painting"
    puts ""
#options - add painting, add artist (empty array of works) create exhibit, add museum, create message for exhibit  
end 

def update
    puts ""
    puts "What records would you like to update?"
    puts ""
    puts "Update a work's value"
    puts ""
#options - update message for exhibit, update artist dod, update a work's value, update end of exhibit- extend run  
end 

def retrieve
    puts "What records would you like to retrieve?"
#options - all the artists, all the museums, all the exhibits, all the works 
#options - museums 
    #all the messages used at the museum 
    #all the paintings which have appeared at the musuem 
    #name 

#options - exhibits 
    #all the works in a given exhibit 
    #start date
    #end date
    #musuem 
    #artist 

#options - artists 
    #date of birth 
    #date of death 
    #works 
    #name 
    #artist with most works in Bmore 
    #which artists have appeared in exhibits 
    #which artists have not appeared in exhibits 

#options - works
    #price of work 
    #date of creation 
    #most valuable painting in collection 
    #title
    #artist 
    #find random work to promote on website 
    #all works created within a 20-year window of a specific year 
end 

def destroy
        puts ""
        puts "Destroy forgery"
        puts ""

#options - destroy a painting if a forgery or if its sold, destroy an exhibit if it ends, 
# destroy a museum if it burns down b/c shit happens 

end 