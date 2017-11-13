class CreateSpaceAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :space_amenities do |t|
      t.integer :amenity_id
      t.integer :space_id

      t.timestamps
    end
  end
end
