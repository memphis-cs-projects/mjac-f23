class CreateReturns < ActiveRecord::Migration[7.0]
  def change
    create_table :returns do |t|
      t.text :reason
      t.string :status
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
