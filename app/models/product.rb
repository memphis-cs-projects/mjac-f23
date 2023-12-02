# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  available   :boolean          default(TRUE)
#  category    :string
#  description :string
#  image       :string
#  name        :string
#  price       :decimal(, )
#  user        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
  # STO-7
  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: 'user_id',
    inverse_of: :products,
  )

  # Active Storage
  has_one_attached :image

  # STO-6_9
  has_many(
    :histories,
    class_name: "History",
    foreign_key: "product_id",
    inverse_of: :product,
    dependent: :destroy
  )

  has_many :orders, through: :histories

  # STO-Review
  has_many(
    :review,
    class_name: "Review",
    foreign_key: "product_id",
    inverse_of: :product,
    dependent: :destroy
  )

end
