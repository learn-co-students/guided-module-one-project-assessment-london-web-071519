class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name 
      t.integer :dob
      t.integer :dod #how to set default to nil? , default nil 
  end
end
end 