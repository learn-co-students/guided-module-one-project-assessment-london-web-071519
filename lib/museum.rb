class Museum < ActiveRecord::Base 
    has_many :exhibits
    has_many :artists, through: :exhibits #Museum.all[0].exhibits[0].artist
    has_many :works, through: :artists # Museum.all[0].exhibits[0].artist.works
    #Museum.all[0].exhibits[0].artist.works[0].title

    # def Museum.find_works(museum) 
    #   Museum.all[0].exhibits[0].artist.works[0].title  
        # exhibits = Exhibit.all.find_by(museum: museum)
    #       artists = exhibits.map {|each_exhibit| each_exhibit.artist}  
    #       artists.each do |artist|
    #         puts artist.works
    #      end 
    # end 



    # def works #find the paintings which have appeared in this museum (unique list)
    #     exhibits.map {|exhibit| exhibit.artist.works}.uniq  
    # end 

end 

