class AddAttendeeIndexToRsvps < ActiveRecord::Migration[6.1]
  def change
    add_index :rsvps, :attendee_id
  end
end
