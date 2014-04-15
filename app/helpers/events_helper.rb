module EventsHelper
	def check(event)
		d = event.start_date
		t = event.end_time
		dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
		dt < DateTime.now
	end
end
