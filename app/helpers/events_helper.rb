module EventsHelper
	def check(event)
		event.end_time < Time.now
	end

	def day(event)
		x = event.start_date
		y = Time.now
		x.strftime("%A, %b %e") == y.strftime("%A, %b %e")
	end
end
