class Work < ActiveRecord::Base 
    belongs_to :artist
   # has_many :exhibits, through: artist
   # Work.all[0].artist.exhibits

    def Work.titles
        Work.all.map do |works|
        works.title
    end 
    end 
    
    def Work.most_valuable_work #find most valuable work in city collection 
        var1 = Work.all.inject {|acc, work| acc.value > work.value ? acc : work}
        var2 = Artist.all.find_by(id: var1.artist_id)
        puts var1.title 
        puts var1.value 
        puts var1.year 
        puts var2.name 
    end 

    def Work.randomly_select #find work to promote from collection on website - to change daily 
        var1 = Work.all.sample 
        var2 = Artist.all.find_by(id: var1.artist_id)
        puts var1.title 
        puts var1.value 
        puts var1.year 
        puts var2.name
    end 


    def Work.by_period(year) #find all works within a 20-year time period; can i do this with .map? 
        period = []
        Work.all.each do |work| 
            if work.year < (year.to_i + 10) && work.year > (year.to_i - 10)
                period << work.title 
            end 
        end 
        puts period 
    end 
end 

#binding.pry
