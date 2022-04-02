class RemoveDateFromFlats < ActiveRecord::Migration[6.1]
  def change
    remove_column :flats, :date_start, :date
    remove_column :flats, :date_end, :date
  end
end
