class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.string :accessibility
      t.string :bike_rack
      t.string :coffee
      t.string :computer
      t.string :kitchen
      t.string :locked_door
      t.string :monitor
      t.string :parking
      t.string :pet_friendly
      t.string :phone
      t.string :price
      t.string :printer
      t.string :shower
      t.string :tv
      t.string :wifi

      t.timestamps
    end
  end
end
