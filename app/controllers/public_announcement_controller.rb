class PublicAnnouncementController < ApplicationController
	#ANNOUNCEMENTPUBLICS_PER_PAGE = 3
	def index

  	@announcementpublics = Announcement.paginate(page: params[:page], per_page: 3).order(id: :desc).where("expiration_date >= ?",Time.now)

	end

  def show
  	@announcementpublic = Announcement.find(params[:id])
  end

end
