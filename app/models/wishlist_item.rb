# == Schema Information
#
# Table name: wishlist_items
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_wishlist_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class WishlistItem < ApplicationRecord
  #belongs_to :user
  belongs_to :product


end
