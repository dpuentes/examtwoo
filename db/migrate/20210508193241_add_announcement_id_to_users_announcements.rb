class AddAnnouncementIdToUsersAnnouncements < ActiveRecord::Migration[6.0]
  def change
    add_reference :users_announcements, :announcement, null: false, foreign_key: true
  end
end
