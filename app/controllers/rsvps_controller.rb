class RsvpsController < ApplicationController
  def index
    @users = User.all
    @event = Event.find(params[:attended_event_id])
  end

  def create
    rsvp = Rsvp.new(attended_event_id: rsvp_params[:attended_event_id], attendee_id: rsvp_params[:attendee_id])
    flash[:notice] = 'Something went wrong!' unless rsvp.save
    redirect_to rsvps_path attended_event_id: rsvp.attended_event_id
  end

  def update
    rsvp = Rsvp.find(rsvp_params[:id])
    # binding.pry
    rsvp.update(rsvp_params)
    redirect_to event_path rsvp.attended_event_id
  end

  def destroy
    rsvp = Rsvp.find_by(rsvp_params)
    # binding.pry
    rsvp.destroy
    # redirect_to rsvps_path(attended_event_id: rsvp.attended_event_id)
    redirect_back fallback_location: rsvps_path(attended_event_id: rsvp.attended_event_id)
  end

  private

  def rsvp_params
    params.permit(:id, :attended_event_id, :attendee_id, :accepted)
  end
end
