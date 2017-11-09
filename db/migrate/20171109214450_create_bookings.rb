class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.datetime :booking_date
      t.integer :desk_id
      t.integer :user_id

      t.timestamps
    end
  end
end
