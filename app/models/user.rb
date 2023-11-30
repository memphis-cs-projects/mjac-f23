# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  city                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  state                  :string
#  street_address         :string
#  zip_code               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many(
    :products,
    class_name: 'Product',
    foreign_key: 'user_id',
    inverse_of: :user,
    dependent:   :destroy
  )

  has_many(
    :orders,
    class_name: 'Order',
    foreign_key: 'user_id',
    inverse_of: :user,
    dependent:   :destroy
  )

  def full_name
    "#{first_name} #{last_name}"
  end
end
