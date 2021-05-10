class Announcement < ApplicationRecord
	has_rich_text :content
	belongs_to :user
	validates :title, presence: true, uniqueness: true
end
