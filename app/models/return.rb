# == Schema Information
#
# Table name: returns
#
#  id         :bigint           not null, primary key
#  reason     :text
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint           not null
#
# Indexes
#
#  index_returns_on_order_id  (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#
# app/models/return.rb

class Return < ApplicationRecord
  belongs_to :order, optional: true

  before_save :perform_additional_checks

  private

  def perform_additional_checks
    # Perform additional checks only if the order is present
    return if order.nil?

    # Your additional checks or logic here
  end
end
