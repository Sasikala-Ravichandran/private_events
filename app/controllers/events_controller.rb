class EventsController < ApplicationController
  def index
  	@events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end 
 
  def new
  	@event = current_user.created_events.build
  end

  def create
  	@event = current_user.created_events.build(event_params)
  	if @event.save
  		redirect_to @event
  	else
  		render 'new'
  	end
  end
  def edit

  end

  def destroy
  end

  private
  def event_params
  	params.require(:event).permit(:title, :location, :date, :time)
  end
end
