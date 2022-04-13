class AddBedsToFlats < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :beds, :integer
  end
end
