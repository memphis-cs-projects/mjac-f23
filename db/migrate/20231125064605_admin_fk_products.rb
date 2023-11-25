class AdminFkProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :user, foreign_key: true
  end
end
