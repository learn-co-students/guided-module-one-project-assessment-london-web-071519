#museums already in db
# bma = Museum.create("Baltimore Museum of Art")
# walters = Museum.create("Walters Art Museum")

#artists 
# Artist.create(name: "Paul Cézanne", dob: 1839, dod: 1906)
# Artist.create(name: "Henri Matisse",  dob: 1869, dod: 1954)
# Artist.create(name: "Auguste Rodin",  dob: 1840, dod: 1917)
# Artist.create(name: "Nick Cave", dob: 1959)
# Artist.create(name: "Spencer Finch",  dob: 1962)
# Artist.create(name: "Alma Thomas", dob: 1891, dod: 1978)

# #paintings 
# Work.create(title: "Mont Sainte‑Victoire Seen from the Bibémus Quarry", value: 895000, year: 1897, artist_id: Artist.all[0].id)
# Work.create(title: "Reclining Model with a Flowered Robe", value: 450000, year: 1923, artist_id: Artist.all[1].id)
# Work.create(title: "Blue Nude", value: 900000, year: 1907, artist_id: Artist.all[1].id)
# Work.create(title: "Nude on Armchair", value: 300000, year: 1935, artist_id: Artist.all[1].id)
# Work.create(title: "Large Reclining Nude", value: 1000000, year: 1935, artist_id: Artist.all[1].id)
# Work.create(title: "The Thinker", value: 285000, year: 1904, artist_id: Artist.all[2].id)
# Work.create(title: "29 hearts", value: 700000, year: 2013, artist_id: Artist.all[3].id)
# Work.create(title: "Moon Dust (Apollo 17)", value: 600000, year:2009, artist_id: Artist.all[4].id)
# Work.create(title: "Red Sunset, Old Pond Concerto", value: 1200000, year:1977, artist_id: Artist.all[5].id)
# Work.create(title: "Snoopy Sees a Sunrise", value: 950000, year: 1970, artist_id: Artist.all[5].id)
# Work.create(title: "Light Blue Nursery", value: 975000, year: 1968, artist_id: Artist.all[5].id)


##exhibits 

# winter_matisse = Exhibit.new(artist_id: Artist.all[1].id, museum_id: Museum.all[0].id, "2019-12-31")
# fall_rodin = Exhibit.new(artist_id: Artist.all[0].id, walters, "2019-10-31") 
# winter_finch = Exhibit.new(artist_id: Artist.all[4].id, bma, "2020-03-15") 
# thomas_2020 = Exhibit.new(artist_id: Artist.all[5].id, museum_id: , "2020-01-01", "2020-05-31")

# winter_matisse.add_update_description("Join Matisse in the South of France!")
# thomas_2020.add_update_description("A Celebration of Artistic Excellent with Alma Thomas")
