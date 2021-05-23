class AddUserIdToAnnouncements < ActiveRecord::Migration[6.0]
  def change
    add_reference :announcements, :user, null: false, foreign_key: true
end
