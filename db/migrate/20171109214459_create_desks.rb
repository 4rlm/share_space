class CreateDesks < ActiveRecord::Migration[5.1]
  def change
    create_table :desks do |t|
      t.integer :space_id
      t.string :description
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
