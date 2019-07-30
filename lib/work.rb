class Work < ActiveRecord::Base 
    belongs_to :artist
   # has_many :exhibits, through: artist
   # Work.all[0].artist.exhibits
end 

#binding.pry
0