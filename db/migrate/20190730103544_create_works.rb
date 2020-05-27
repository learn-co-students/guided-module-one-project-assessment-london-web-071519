class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title 
      t.string :artist
      t.integer :value
      t.integer :year 
  end
  end
end
