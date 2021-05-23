class UsersAnnouncementsController < ApplicationController

  def create
  	user_id = current_user.id
  	announcement = Announcement.find(params[:announcement_id])
  	user_announcement = UsersAnnouncement.new(user_id: user_id, announcement_id: announcement.id)
  	#user_announcement.valid?
  	if user_announcement.valid?
  		user_announcement.save
  		redirect_to announcements_path
  		flash[:notice] = "¡Has visto!"

  	else
  		redirect_to public_announcement_index_path
  		flash[:alert] = "¡Opsss! Parece que ya has marcado este anuncio como visto"
  	end
  end
end
