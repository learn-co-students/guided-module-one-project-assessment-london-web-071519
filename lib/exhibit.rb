class Exhibit < ActiveRecord::Base 
    belongs_to :museum
    belongs_to :artist
    has_many :works, through: :artist #Exhibit.all[0].artist.works

    def Exhibit.create_new(artist, museum, start_date_new, end_date_new)
        Exhibit.create(artist_id: Artist.all.find_by_name(artist).id, museum_id: Museum.all.find_by_name(museum).id, start_date: start_date_new, end_date: end_date_new)
    end 

    def Exhibit.newest 
        new_exhibit = Exhibit.all.last
        new_exhibit
    end 

 


    # def Exhibit.find_exhibit_by_name(artist, museum)
    #     Exhibit.all.each do |exhibit| 
    #         if exhibit.artist.name == artist && exhibit.museum.name == museum
    #           puts "This exhibit began on #{exhibit.start_date} and will/did end on #{exhibit.end_date}." 
    #         else 
    #           puts "No such exhibit exists in our database. Would you like to create one?"
    #             response = gets.strip 
    #               if response == "y" || response == "yes" || response == "please"
    #                     create_record
    #                      else 
    #                       retrieve_loop
    #                    end  
    #         end 
    #     end 
    # end 

    #"Henri Matisse"
    # "Baltimore Museum of Art"

#     def Exhibit.find_exhibit_by_end(end_date) 
#         Exhibit.all.select {|exhibit| exhibit.end_date == end_date}
#     end 

#     def Exhibit.find_by(artist, end_date)
#         if Exhibit.find_exhibit_by_name(artist) && Exhibit.find_exhibit_by_end(end_date) 
#             var1 = Exhibit.find_exhibit_by_end(end_date).map {|exhibit| exhibit.end_date}.pop
#         end
#     end 

#     # def add_update_description(message)
#     #     "#{message}"
#     # end 
#     var1

 end 

