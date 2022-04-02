class AddDateToFlats < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :date_start, :date
    add_column :flats, :date_end, :date
  end
end
