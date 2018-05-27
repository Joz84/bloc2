class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :Date
    add_column :users, :phone, :string
    add_column :users, :sex, :integer
    add_column :users, :admin, :boolean
    add_column :users, :stripe_id, :string
  end
end
