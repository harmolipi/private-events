class Event < ApplicationRecord
  # has_many :attended_event_attendees, foreign_key: :attended_event_id
  # has_many :attendees, through: :attended_event_attendees
  has_many :rsvps, foreign_key: :attended_event_id
  has_many :attendees, through: :rsvps
  belongs_to :creator, class_name: :user
end
