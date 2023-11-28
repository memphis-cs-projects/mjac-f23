# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  available   :boolean          default(TRUE)
#  category    :string
#  description :string
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
  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: 'user_id',
    inverse_of: :products,
  )

  has_one_attached :image

  has_many(
    :histories,
    class_name: "History",
    foreign_key: "product_id",
    inverse_of: :product,
    dependent: :destroy
  )

  has_many :orders, through: :histories

end
