class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :buyable
      t.boolean :exchangeable
      t.decimal :price
      t.string :category
      t.string :product_type
      t.string :size
      t.boolean :available
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
