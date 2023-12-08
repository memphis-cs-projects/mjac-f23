# == Schema Information
#
# Table name: reviewables
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_reviewables_on_product_id  (product_id)
#  index_reviewables_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class Reviewable < ApplicationRecord
  belongs_to(
    :user,
    class_name: "User",
    foreign_key: "user_id",
    inverse_of: :reviewables
  )

  belongs_to(
    :product,
    class_name: "Product",
    foreign_key: "product_id",
    inverse_of: :reviewables
  )

  validates_uniqueness_of :product_id, scope: :user_id
end
