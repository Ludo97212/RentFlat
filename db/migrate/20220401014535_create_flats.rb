class CreateFlats < ActiveRecord::Migration[6.1]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :address
      t.integer :daily_price
      t.integer :area
      t.text :description
      t.timestamps
    end
  end
end
