class Work < ActiveRecord::Base 
    belongs_to :artist
  #  has_many :exhibits, through: artists
   # Work.all[0].artist.exhibits

    def Work.create_new_work(title_new, value_new, year_new, artist)
        Work.create(title: title_new, value: value_new, year: year_new, artist_id: Artist.all.find_by_name(artist).id)
    end 

    def Work.titles
        Work.all.map do |works|
        works.title
    end 
    end 
    
    def Work.most_valuable #find most valuable work in city collection 
        var1 = Work.all.inject {|acc, work| acc.value > work.value ? acc : work}
        var1
    end 

    def Work.randomly_select #find work to promote from collection on website - to change daily 
        Work.all.sample 
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

# def works_exist 
#     if Work.by_period(year).length == 0
#          puts "No works exist in Baltimore's collection. Would you like to donate one?" 
#          response = gets.strip 
#          if response == "y" || response == "yes" || response == "please"
#              create_new_work
#          else puts period 
#          end 
#      end 
#  end 
    # if Work.by_period(year) == nil 
    #     puts "No works exist in Baltimore's collection. Would you like to donate one?" 
    #     [2] pry(main)* end 





