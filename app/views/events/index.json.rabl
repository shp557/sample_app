collection @events

attributes :id

node(:title) { |event| event.tag }
node(:start) { |event| event.start_time }
node(:end) { |event| event.end_time }
node(:allDay) { false }

node(:url) { |event| event_url(event) }
