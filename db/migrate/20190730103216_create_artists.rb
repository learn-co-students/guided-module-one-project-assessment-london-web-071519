class CreateArtists < ActiveRecord::Migration[5.2]
  def change
        create_table :artists do |t|
          t.string :name 
          t.integer :dob
          t.integer :dod, default: nil 
      end
    end
    end 
