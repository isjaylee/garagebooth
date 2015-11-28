class AddLatLongToBooth < ActiveRecord::Migration
  def change
    add_column :booths, :latitude, :float
    add_column :booths, :longitude, :float
  end
end
