class Event < ActiveRecord::Base
	belongs_to :user

	validates :tag, presence: true, length: { maximum: 80 }
	validates :user_id, presence: true
	validates :content, presence: true
	validates :start_date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true, date: { :after => :start_time}

	
	before_save :convert



	def convert
		d = self.start_date
		self.start_time.change(year: d.year, month: d.month, day: d.day)
		self.end_time.change(year: d.year, month: d.month, day: d.day)
  	end

end
