class Invitation < ApplicationRecord
  validates :invitee_id, uniqueness: { scope: :event_id }
  belongs_to :event
  belongs_to :invitee, class_name: 'User'
end
