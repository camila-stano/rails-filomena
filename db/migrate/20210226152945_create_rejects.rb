class CreateRejects < ActiveRecord::Migration[6.0]
  def change
    create_table :rejects do |t|
      t.boolean :reject, default: true 
      t.references :users, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
