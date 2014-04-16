module EventsHelper
	def check(event)
		Time.zone = 'Eastern Time (US & Canada)'
		d = event.start_date
		t = event.end_time
		dt = Time.zone.local(d.year, d.month, d.day, t.hour, t.min, t.sec)
		dt < Time.zone.now
	end
end
