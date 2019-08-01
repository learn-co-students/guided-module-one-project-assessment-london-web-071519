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

 end 

