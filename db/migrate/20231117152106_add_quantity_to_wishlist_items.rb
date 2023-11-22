class AddQuantityToWishlistItems < ActiveRecord::Migration[7.0]
  def change
    add_column :wishlist_items, :quantity, :integer
  end
end
