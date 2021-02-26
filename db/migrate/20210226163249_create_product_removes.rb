class CreateProductRemoves < ActiveRecord::Migration[6.0]
  def change
    create_table :product_removes do |t|
      t.boolean :product_remove, default: false
      
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
