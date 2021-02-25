class AddRatingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rating, :decimal, precision: 2, scale: 1
  end
end
