class UsersAnnouncement < ApplicationRecord

	belongs_to :user, required: true
	belongs_to  :announcement, required: true
	validates_uniqueness_of :user_id, scope: [:user_id, :announcement_id]

end
 