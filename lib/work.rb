class Work < ActiveRecord::Base 
    belongs_to :artist
   # has_many :exhibits, through: artist
   # Work.all[0].artist.exhibits

    def Work.titles
    Work.all.map do |works|
        works.title
    end 
    end 

end 

#binding.pry
0