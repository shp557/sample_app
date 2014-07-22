module EventsHelper
	def check(event)
		event.end_time < Time.now
	end

	def day(event)
		x = event.start_date
		y = Time.now
		x.strftime("%A, %b %e") == y.strftime("%A, %b %e")
	end

	def listview(events)
		list = Array.new
		ary = Array.new
		
		events.each do |event|

			if list.empty? && ary.empty?
				list.push(Array.new)
				list.last.push(event)
				
			else
				if list.last.first.start_date.strftime("%A, %b %e") == event.start_date.strftime("%A, %b %e")
					list.last.push(event)	
				else
					list.push(Array.new)
					list.last.push(event)
				end
			end
		end

		list 

	end

	def simple_format_mod(text, html_options = {}, options = {})

	  text = sanitize(text) if options.fetch(:sanitize, true)
	  paragraphs = split_paragraphs(text)

	  if paragraphs.empty?
	  else
	    paragraphs.map! { |paragraph|
	      raw(paragraph)}.join("\n\n").html_safe
	  end
	end
end
