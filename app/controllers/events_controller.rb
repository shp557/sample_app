class EventsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]
	
	def index
		#@events = Event.all.sort_by{ |event| [event.start_date, event.start_time] }
		@events = Event.where('start_date >= ?', Date.today).sort_by{ |event| [event.start_date, event.start_time] }
	end

	def show
		@event = Event.find(params[:id])
		
		respond_to do |format|
      		format.html
      		format.js
    	end
	end

    def new
    	@event = current_user.events.build
	end 

	def create
		@event = current_user.events.build(event_params)
	    if @event.save
	      flash[:success] = "Event created!"
	      redirect_to root_url
	    else
	      render 'new'
	    end
	end

	def edit
		#@event = Event.find(params[:id])
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
	      redirect_to root_url if @event.nil?
    	end
end
