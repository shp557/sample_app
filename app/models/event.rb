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
		self.start_time = Time.zone.local(d.year, d.month, d.day, self.start_time.hour, self.start_time.min, self.start_time.sec)
		self.end_time = Time.zone.local(d.year, d.month, d.day, self.end_time.hour, self.end_time.min, self.end_time.sec)
		logger.debug "Come thru"
	end

	

end
