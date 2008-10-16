class AddLatitudeAndLongitudeToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :latitude, :float
    add_column :clients, :longitude, :float
  end

  def self.down
    remove_column :clients, :longitude
    remove_column :clients, :latitude
  end
end
