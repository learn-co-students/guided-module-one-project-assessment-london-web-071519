class Artist <ActiveRecord::Base 
    has_many :works
    has_many :exhibits 
    has_many :museums, through: :exhibits 

    def Artist.names
        Artist.all.map do |artist|
            artist.name
        end 
    end 
end 



