class DropInvitations < ActiveRecord::Migration[6.1]
  def change
    drop_table :invitations, force: :cascade do |t|
      t.integer "event_id", null: false
      t.integer "invitee_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["event_id"], name: "index_invitations_on_event_id"
      t.index ["invitee_id"], name: "index_invitations_on_invitee_id"
    end
  end
end
