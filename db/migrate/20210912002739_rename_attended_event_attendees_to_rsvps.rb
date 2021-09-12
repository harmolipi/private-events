class RenameAttendedEventAttendeesToRsvps < ActiveRecord::Migration[6.1]
  def change
    rename_table :attended_events_attendees, :rsvps
  end
end
