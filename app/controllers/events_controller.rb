class EventsController < ApplicationController

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
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
      @event.attendees << current_user
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