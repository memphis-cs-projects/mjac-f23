class RemoveQuantityFromWishlistItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :wishlist_items, :quantity, :integer
  end
end
