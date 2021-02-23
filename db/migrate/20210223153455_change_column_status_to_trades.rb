class ChangeColumnStatusToTrades < ActiveRecord::Migration[6.0]
  def change
    change_column_default :trades, :status, 'incomplete'
  end
end
