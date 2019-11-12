class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :title
      t.string :address
      t.string :photo
      t.text :description
      t.integer :price_per_day
      t.references :owner, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
