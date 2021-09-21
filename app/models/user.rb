class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rsvps, foreign_key: :attendee_id
  has_many :attended_events, through: :rsvps
  has_many :invitations, foreign_key: :invitee_id
  has_many :invited_events, through: :invitations, source: :event
  has_many :events, foreign_key: :creator_id
end
