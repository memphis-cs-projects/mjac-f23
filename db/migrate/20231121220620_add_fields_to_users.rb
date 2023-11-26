class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street_address, :string
    add_column :users, :zip_code, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :admin, :boolean, default: false
  end
end
