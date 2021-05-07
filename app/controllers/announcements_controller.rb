class AnnouncementsController < ApplicationController
	before_action :find_announcement, except: [:new, :create, :index, :author]
	before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
	##tambien sirve excep: [:new,:create, :index]

	def index
		@announcements = Announcement.all
	end
	
	def show
	end

	def edit
		puts "\n\n\n #{@announcement.persisted?} \n\n\n"
	end

	def update
		@announcement.update(announcement_params)
		redirect_to @announcement
	end

	def new
		@announcement = Announcement.new
	end

	def create
		@announcement = current_user.announcements.create(announcement_params)
		redirect_to @announcement
	end

	def destroy
		@announcement.destroy
		redirect_to announcements_new_path
	end

	def author
		@user = User.find(params[:user_id])
	end

	def find_announcement
		@announcement = Announcement.find(params[:id])		
	end

	def announcement_params
		params.require(:announcement).permit(:title,:content)
		
	end


end
