class AddDetailsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :content, :string
    add_column :events, :start_date, :datetime
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
    add_column :events, :location, :string
  end
end
