class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :message
      t.references :user, null: false
      t.references :flat, null: false
      t.timestamps
    end
  end
end
