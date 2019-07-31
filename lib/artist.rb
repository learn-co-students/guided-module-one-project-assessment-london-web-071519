class Artist <ActiveRecord::Base 
    has_many :works
    has_many :exhibits 
    has_many :museums, through: :exhibits 

    def Artist.names
        Artist.all.each do |artist|
        puts artist.name
        end 
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



