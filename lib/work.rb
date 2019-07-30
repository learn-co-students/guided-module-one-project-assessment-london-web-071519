class Work < ActiveRecord::Base 
    belongs_to :artist
   # has_many :exhibits, through: artist
end 

#binding.pry
0