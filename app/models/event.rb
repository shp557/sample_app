class Event < ActiveRecord::Base
	belongs_to :user

	validates :tag, presence: true, length: { maximum: 80 }
	validates :user_id, presence: true
	validates :content, presence: true
	validates :start_date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true, date: { :after_or_equal_to => :start_time}

end
