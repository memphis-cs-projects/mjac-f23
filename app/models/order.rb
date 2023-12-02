# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  has_one :return
  accepts_nested_attributes_for :return
  has_one :return, dependent: :destroy

  # STO-6_9
  has_many(
    :histories,
    class_name: "History",
    foreign_key: "order_id",
    inverse_of: :order,
    dependent: :destroy
  )

  has_many :products, through: :histories

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: "user_id",
    inverse_of: :orders
  )
end
