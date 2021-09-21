class InvitationsController < ApplicationController
  def index
    @users = User.all
    @event = Event.find(params[:event_id])
  end

  def create
    invitation = Invitation.new(event_id: invitation_params[:event_id], invitee_id: invitation_params[:invitee_id])
    flash[:notice] = 'Something went wrong!' unless invitation.save
    redirect_to invitations_path event_id: invitation_params[:event_id]
  end

  def destroy
    invitation = Invitation.find(params[:id])
    rsvp = Rsvp.find_by(attended_event_id: invitation.event_id, attendee_id: invitation.invitee_id)
    invitation.destroy
    rsvp.destroy if rsvp
    redirect_to invitations_path event_id: invitation.event_id
  end

  private

  def invitation_params
    params.permit(:event_id, :invitee_id)
  end
end
