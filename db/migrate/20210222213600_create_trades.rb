class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.boolean :super_like
      t.string :status
      t.text :review_content
      t.decimal :review_rating
      t.references :clothes, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
