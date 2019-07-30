class Museum < ActiveRecord::Base 
    has_many :exhibits
    has_many :artists, through: :exhibits 
    has_many :works, through: :artists, through: :exhibits 
end 

# bma = Museum.create(name: "Baltimore Museum of Art")
# walters = Museum.create(name: "Walters Art Museum")

binding.pry
0