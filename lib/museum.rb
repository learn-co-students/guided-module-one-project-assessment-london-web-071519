class Museum < ActiveRecord::Base 
    has_many :exhibits
    has_many :artists, through: :exhibits #Museum.all[0].exhibits[0].artist
    has_many :works, through: :artists # Museum.all[0].exhibits[0].artist.works

    # def Museum.find_works
    #     Museum.all.find

    # end 
end 

