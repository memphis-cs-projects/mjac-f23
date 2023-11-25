# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
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
end
