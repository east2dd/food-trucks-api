class CreateTrucks < ActiveRecord::Migration[7.0]
  def change
    create_table :trucks do |t|
      t.integer :locationid
      t.string :applicant
      t.string :facilitytype
      t.string :cnn
      t.string :locationdescription
      t.string :address
      t.string :blocklott
      t.string :block
      t.string :lot
      t.string :permit
      t.string :status
      t.string :fooditems
      t.float :x
      t.float :y
      t.float :latitude
      t.float :longitude
      t.string :schedule
      t.string :dayshours
      t.string :noisent
      t.datetime :approved
      t.string :received
      t.integer :priorpermit
      t.datetime :expirationdate
      t.string :location
      t.timestamps
    end
  end
end
