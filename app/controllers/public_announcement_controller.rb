class PublicAnnouncementController < ApplicationController
	def index
  	@announcementpublics = Announcement.all
	end

  def show
  	@announcementpublic = Announcement.find(params[:id])
  end

end
