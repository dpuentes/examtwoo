class AddExpirationDateToAnnouncements < ActiveRecord::Migration[6.0]
  def change
    add_column :announcements, :expiration_date, :datetime
  end
end
