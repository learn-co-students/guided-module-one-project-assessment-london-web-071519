
class Artist <ActiveRecord::Base 
    has_many :works
    has_many :exhibits 
    has_many :museums, through: :exhibits 

    def Artist.names
        artists = []
        Artist.all.each do |artist|
            artists << artist.name 
        end 
        all_artists = artists.uniq
        all_artists.each do |artist_each|
            puts artist_each 
        end 
    end 

    def Artist.newest
        new_artist = Artist.all.last 
        puts new_artist.name
        puts new_artist.dob
        puts new_artist.dod 
    end 

    # def self.most_works #artist with the most paintings in Bmore
    #     self.all.inject {|acc, artist| acc.works.count > artist.works.count ? acc : artist}
    # end 

    # def self.exhibits #find which artists have not yet appeared in their own exhibit 
    #     #this currently finds the oposit 
    #     array = []
    #     Exhibit.all.each do |exhibit|
    #         Artist.all.each do |artist|
    #        array << exhibit.artist 
    #  end
    # end 
    #  array.uniq
    # end 

    # def self.no_exhibits 
    #     self.all - self.exhibits 
    # end

end 



