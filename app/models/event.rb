class Event < ActiveRecord::Base
	belongs_to :user

	validates :tag, presence: true, length: { maximum: 80 }
	validates :user_id, presence: true
	validates :content, presence: true
	validates :start_date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true, date: { :after_or_equal_to => :start_time}

	
	before_save :convert



	def convert
		d = self.start_date
		t = self.start_time

		self.start_time = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
		self.end_time = DateTime.new(self.start_date.year, self.start_date.month, self.start_date.day, 
		self.end_time.hour, self.end_time.min, self.end_time.sec)

  	end

end
