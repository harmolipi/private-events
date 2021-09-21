class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rsvps, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :rsvps, dependent: :destroy
  has_many :invitations, foreign_key: :invitee_id, dependent: :destroy
  has_many :invited_events, through: :invitations, source: :event, dependent: :destroy
  has_many :events, foreign_key: :creator_id, dependent: :destroy

  def invited?(event_id)
    invited_events.exists?(event_id)
  end

  def accepted?(event_id)
    rsvps.exists?(attended_event_id: event_id)
  end
end
