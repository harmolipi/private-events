class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true

  has_many :rsvps, foreign_key: :attended_event_id
  has_many :attendees, through: :rsvps
  belongs_to :creator, class_name: 'User'
end
