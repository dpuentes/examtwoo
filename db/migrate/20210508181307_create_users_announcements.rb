class CreateUsersAnnouncements < ActiveRecord::Migration[6.0]
  def change
    create_table :users_announcements do |t|

      t.timestamps
    end
  end
end
