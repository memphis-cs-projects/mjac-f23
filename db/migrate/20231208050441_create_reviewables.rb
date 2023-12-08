class CreateReviewables < ActiveRecord::Migration[7.0]
  def change
    create_table :reviewables do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
