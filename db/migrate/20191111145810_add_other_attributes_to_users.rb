class AddOtherAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :avatar, :string
    add_column :users, :description, :text
  end
end
