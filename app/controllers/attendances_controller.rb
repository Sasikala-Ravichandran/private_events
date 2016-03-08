class AttendancesController < ApplicationController

  def create
    @event = Event.find_by(:id => params[:attendance][:attending_events_id])
    @attendance = current_user.attendance.build(:attending_events_id => params[:attendance][:attending_events_id])
    if @attendance.save
      flash[:notice] = "Successfully followed"
      redirect_to @event 
    else
      flash[:error] = "unable to follow"
      redirect_to event_path(@attendance.attending_event_id)
    end
	end

  def destroy
    @attendance = current_user.attendance.find(params[:id])
    @event = @attendance.attending_events
    @attendance.destroy
    flash[:notice] = "Successfully cancelled"
    redirect_to @event 
	end
end
