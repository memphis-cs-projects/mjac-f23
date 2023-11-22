class AddNameToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :name, :string
  end
end
