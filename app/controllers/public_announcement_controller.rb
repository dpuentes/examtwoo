class PublicAnnouncementController < ApplicationController
	before_action :authenticate_user!, only: [:index,:show]
	def index
  	@announcementpublics = Announcement.paginate(page: params[:page], per_page: 3).order(id: :desc).where("expiration_date >= ?",Time.now)
	end

  def show
  	@announcementpublic = Announcement.find(params[:id])
  end

end
