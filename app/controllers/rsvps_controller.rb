class RsvpsController < ApplicationController
  def create
    rsvp = Rsvp.new(attended_event_id: rsvp_params[:attended_event_id], attendee_id: current_user.id)
    flash[:notice] = 'Something went wrong!' unless rsvp.save
    redirect_to event_path rsvp_params[:attended_event_id]
  end

  def destroy
    rsvp = Rsvp.find_by(attended_event_id: rsvp_params[:attended_event_id], attendee_id: current_user.id)
    rsvp.destroy
    redirect_to event_path(rsvp_params[:attended_event_id])
  end

  private

  def rsvp_params
    params.permit(:attended_event_id)
  end
end
