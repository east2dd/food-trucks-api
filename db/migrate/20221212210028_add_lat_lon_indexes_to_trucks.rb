class AddLatLonIndexesToTrucks < ActiveRecord::Migration[7.0]
  def change
    add_index :trucks, [:latitude, :longitude]
  end
end
