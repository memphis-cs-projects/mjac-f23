# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  available   :boolean          default(TRUE)
#  category    :string
#  description :string
#  name        :string
#  price       :decimal(10, 2)
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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
