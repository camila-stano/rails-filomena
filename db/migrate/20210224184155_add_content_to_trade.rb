class AddContentToTrade < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :content, :text
  end
end
