class EventsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	
	def index
		#@events = Event.all.sort_by{ |event| [event.start_date, event.start_time] }
		@events = Event.where('start_date >= ?', Date.today).sort_by{ |event| [event.start_date, event.start_time] }
	end

	def calendar
		@events = Event.all
		respond_to do |format|
    		format.html
    		format.json 
    	end
  	end

  	def export
		@events = Event.all
		@ary = Array.new

		@events.each do |event|
		  	@e=Icalendar::Event.new   

		  	@a = event.start_time
		  	@b = event.end_time
		  	@e.dtstart=DateTime.civil(@a.year, @a.month, @a.day, @a.hour, @a.min)    
            @e.dtend=DateTime.civil(@b.year, @b.month, @b.day, @b.hour, @b.min)  

		    @e.summary = event.tag
		    @e.description = event.content
		    @e.uid = event.id
		    @e.url = event_url(event)
		  	@ary.push(@e)
		end
  		respond_to do |format|
    		format.ics
    		format.html
  		end  
	end

	def show
		@event = Event.find(params[:id])
		
		respond_to do |format|
      		format.html
    	end
	end

    def new
    	@event = Event.new
	end 

	def create
		@event = current_user.events.build(event_params)
	    if @event.save
	      flash[:success] = "Event created!"
	      redirect_to calendar_path
	    else
	      render 'new'
	    end
	end

	def edit
	end
	
	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
		  flash[:success] = "Event updated"
		  redirect_to user_path(current_user)
		else
		  render 'edit'
		end
    end

	def destroy
		Event.find(params[:id]).destroy
	    flash[:success] = "Event deleted."
	    redirect_to user_path(current_user)
	end

	private

	    def event_params
	      params.require(:event).permit(:tag, :content, :start_date, :start_time, :end_time, :location)
	    end

	    def correct_user
	      @event = current_user.events.find_by(id: params[:id])
	      redirect_to calendar_path if @event.nil?
    	end

    	def admin_user
      	  redirect_to(calendar_path) unless current_user.admin?
    	end
end
