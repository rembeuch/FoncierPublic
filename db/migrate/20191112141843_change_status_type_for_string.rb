class ChangeStatusTypeForString < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :status, :string, default: "En attente"
  end
end
