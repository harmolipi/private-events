class Rsvp < ApplicationRecord
  validates :attendee_id, presence: true, uniqueness: { scope: :attended_event_id }
  validates :attended_event_id, presence: true

  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  scope :past, -> { joins(:attended_event).where(accepted: true).where('events.date < ?', Date.today) }
  scope :future, -> { joins(:attended_event).where(accepted: true).where('date > ?', Date.today) }
end
