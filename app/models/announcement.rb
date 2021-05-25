class Announcement < ApplicationRecord
	has_rich_text :content
	belongs_to :user
	has_many  :users_announcements, dependent: :destroy
	validates :title, presence: true, uniqueness: true,  length: { minimum: 4, maximum: 30 }
	validates :content, presence: true, length: { maximum: 140 }
	validates :expiration_date, presence: true
end
