class Exhibit < ActiveRecord::Base 
    belongs_to :museum
    belongs_to :artist
    has_many :works, through: :artist #Exhibit.all[0].artist.works

    # def add_update_description(message)
    #     "#{message}"
    # end 

end 

# binding.pry
# 0