class Exhibit < ActiveRecord::Base 
    belongs_to :museum
    belongs_to :artist
    has_many :works, through: :artist 
end 