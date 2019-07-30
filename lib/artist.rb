class Artist <ActiveRecord::Base 
    has_many :works
    has_many :exhibits 
    has_many :museums, through: :exhibits 
end 


