class AddDetailsToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :square_meter, :integer
    add_column :flats, :capacity, :integer
  end
end
