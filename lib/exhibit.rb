class Exhibit < ActiveRecord::Base 
    belongs_to :museum
    belongs_to :exhibit
    has_many :works, through: :artist
end 
