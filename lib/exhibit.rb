class Exhibit < ActiveRecord::Base 
    belongs_to :museum
    belongs_to :artist
    has_many :works, through: :artist #Exhibit.all[0].artist.works

#     def Exhibit.find_exhibit_by_name(artist, end_date) 
#          var1 = nil  
#         Exhibit.all.each do |exhibit| 
#             if exhibit.artist.name == artist && exhibit.end_date == end_date
#                 var1 = exhibit
#             else var1 = "I am not finding this exhibit"
#             end 
#         end 
#     var1
#     end 

#     def Exhibit.find_exhibit_by_end(end_date) 
#         Exhibit.all.select {|exhibit| exhibit.end_date == end_date}
#     end 

#     def Exhibit.find_by(artist, end_date)
#         if Exhibit.find_exhibit_by_name(artist) && Exhibit.find_exhibit_by_end(end_date) 
#             var1 = Exhibit.find_exhibit_by_end(end_date).map {|exhibit| exhibit.end_date}.pop
#         end
#     end 
#     binding.pry
#     # def add_update_description(message)
#     #     "#{message}"
#     # end 
#     var1
 end 

# binding.pry
# 0