class AddDetailsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :content, :string
    add_column :events, :start_date, :date
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
    add_column :events, :location, :string
  end
end
