class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :arrival
      t.date :departure
      t.boolean :accepted
      t.timestamps
    end
  end
end
