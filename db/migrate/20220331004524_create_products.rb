class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :address
      t.string :price
      t.string :category
      t.timestamps
    end
  end
end
