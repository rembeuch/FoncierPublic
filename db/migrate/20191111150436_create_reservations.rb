class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.integer :price
      t.references :flat, foreign_key: true
      t.references :guest, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
