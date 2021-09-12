class AddIndexToRsvps < ActiveRecord::Migration[6.1]
  def change
    add_index :rsvps, :attended_event_id
  end
end
