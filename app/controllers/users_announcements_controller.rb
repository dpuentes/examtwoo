class UsersAnnouncementsController < ApplicationController
  def index
  	@announcements = Announcement.all
  end
end
