
class Artist <ActiveRecord::Base 
    has_many :works
    has_many :exhibits 
    has_many :museums, through: :exhibits 

    def Artist.create_new(artist, dob, dod)
        Artist.create(name: artist, dob: dob, dod: dod)    
    end 

    def Artist.works_by_artist(artist)
        artist_works = Artist.all.find_by_name(artist).works
            artist_works
    end 

    def Artist.names
        artists = []
        Artist.all.each do |artist|
            artists << artist.name 
        end 
        artists.uniq
    end 


    def works_by_artist(artist)
        artist_works = Artist.all.find_by_name(artist).works
        artist_works
    end 

    def Artist.newest
        new_artist = Artist.all.last 
        new_artist
    end 

end 

    # def Artist.most_works #artist with the most paintings in Bmore - working code
    #     Artist.all.inject {|acc, artist| acc.works.count > artist.works.count ? acc : artist}
    # end 

   



