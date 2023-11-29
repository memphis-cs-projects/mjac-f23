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
require "test_helper"

class WishlistItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
