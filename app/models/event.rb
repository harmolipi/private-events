class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true

  has_many :rsvps, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :rsvps, dependent: :destroy
  # has_many :invitations, foreign_key: :event_id, dependent: :destroy
  # has_many :invitees, through: :invitations, dependent: :destroy
  belongs_to :creator, class_name: 'User'

  scope :past, -> { where('date < ?', Date.today) }
  scope :future, -> { where('date > ?', Date.today) }

  def accepted?(attendee_id)
    rsvps.find_by(attendee_id: attendee_id).accepted?
  end
end
