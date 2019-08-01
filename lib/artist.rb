
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

    # def artist_exhibit(artist) 
        
    #     exhibits
    # end 



    # puts "At what museum did the exhibit take place?"
    #     Museum.all_museums
    #     puts ""
    #     museum = gets.strip 
    #         Exhibit.all.each do |exhibit| 
    #          if exhibit.artist.name == artist && exhibit.museum.name == museum
    #             puts "This exhibit began on #{exhibit.start_date} and will/did end on #{exhibit.end_date}." 
    #             retrieve_loop
    #             else 
    #                puts "No such exhibit exists in our database." 
    #                create_loop
    #             end
    #         end


    # def puts_exhibits(artist)
    #     exhibits = artist_exhibit(artist)
    #     exhibits.each {|e}        

    # def artist_exhibit(artist)
    #     Exhibit.all.find_by_artist(artist) 
    # end 

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
 




