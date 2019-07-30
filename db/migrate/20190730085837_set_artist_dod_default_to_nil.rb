class SetArtistDodDefaultToNil < ActiveRecord::Migration[5.2]
  def change
    change_column_default :artists, :dod, 'nil'
  end
end
