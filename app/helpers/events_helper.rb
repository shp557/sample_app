module EventsHelper
	def check(event)
		Time.zone =  'Eastern Time (US & Canada)'
		event.end_time < Time.now
	end

	def day(event)
		Time.zone =  'Eastern Time (US & Canada)'
		x = event.start_date
		y = Time.now
		x.strftime("%A, %b %e") == y.strftime("%A, %b %e")
	end

end
