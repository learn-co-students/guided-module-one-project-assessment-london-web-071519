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
        Work.all.inject {|acc, work| acc.price > work.price ? acc : work}
    end 

    def Work.randomly_select #find work to promote from collection on website - to change daily 
        Work.all.sample 
    end 

    def Work.by_period(year) #find all works within a 20-year time period; can i do this with .map? 
        period = []
        Work.all.each do |work| 
            if work.date < year + 10 && work.date > year - 10
                period << work 
            end 
        end 
        period 
    end 

end 

#binding.pry
0