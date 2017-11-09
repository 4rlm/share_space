class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :description
      t.string :website
      t.string :phone
      t.integer :user_id

      t.timestamps
    end
  end
end
