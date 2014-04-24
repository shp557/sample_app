class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :events, :content, :text, :limit => nil
  end
end
