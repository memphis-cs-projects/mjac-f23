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
require "test_helper"

class ReturnTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
