class Museum < ActiveRecord::Base 
    has_many :exhibits
    has_many :artists, through: :exhibits #Museum.all[0].exhibits[0].artist
    has_many :works, through: :artists # Museum.all[0].exhibits[0].artist.works
    #Museum.all[0].exhibits[0].artist.works[0].title

   # below blocks of code work
    # def find_works(museum)   
        # museum_name = find_museum(museum)
        # museum_name.exhibits.map{|artist| puts artist.works.titles}.uniq 
    # end 

    # def find_museum(museum) this would be for CLI page
            # museum = Museum.all.find_by_name(museum)
    # end 

end 

