class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibits do |t|
      t.integer :artist_id 
      t.integer :museum_id
      t.string  :start_date, default: Date.today.to_s 
      t.string :end_date
  end  
  end
end
