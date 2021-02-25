class ChangeDefaultvalueForAvailable < ActiveRecord::Migration[6.0]
  def change
    change_column_default :products, :available, true
  end
end
