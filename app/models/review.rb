# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  rating     :integer
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_reviews_on_product_id  (product_id)
#  index_reviews_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class Review < ApplicationRecord
  # STO-Review
  belongs_to(
    :user,
    class_name: "User",
    foreign_key: "user_id",
    inverse_of: :reviews
  )

  belongs_to(
    :product,
    class_name: "Product",
    foreign_key: "product_id",
    inverse_of: :review
  )
  
  # have it where each User can leave one review per Product
  # validates_uniqueness_of :user_id, scope: [:user_id, :product_id, :review]
  # validates :user_id, uniqueness: { scope: :product_id, message: "has already left a review for this product" }
  validates :text, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
