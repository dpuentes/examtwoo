class PublicAnnouncementController < ApplicationController
	ANNOUNCEMENTPUBLICS_PER_PAGE = 3
	def index
	@page = params.fetch(:page, 0).to_i
  	@announcementpublics = Announcement.offset(@page * ANNOUNCEMENTPUBLICS_PER_PAGE).limit(ANNOUNCEMENTPUBLICS_PER_PAGE)
	end

  def show
  	@announcementpublic = Announcement.find(params[:id])
  end

end
