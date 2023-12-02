# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint
#
# Indexes
#
#  index_carts_on_product_id  (product_id)
#  index_carts_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class Cart < ApplicationRecord
  belongs_to :product
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :product_id, presence: true
  def subtotal
    quantity * product.price
  end
end
