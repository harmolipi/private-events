class CreateJoinTableEventAttendees < ActiveRecord::Migration[6.1]
  def change
    create_join_table :attended_events, :attendees do |t|
      # t.index [:attended_event_id, :attendee_id]
      # t.index [:attendee_id, :attended_event_id]
    end
  end
end
