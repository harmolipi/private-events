class AddPrimaryKeyToRsvps < ActiveRecord::Migration[6.1]
  def change
    add_column :rsvps, :id, :primary_key
  end
end
