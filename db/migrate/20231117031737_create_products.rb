class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.decimal :price
      t.string :name
      t.string :description
      t.string :category
      t.string :user
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
