class AddAcceptedToRsvps < ActiveRecord::Migration[6.1]
  def change
    add_column :rsvps, :accepted, :boolean, default: false
  end
end
