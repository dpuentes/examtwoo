 class AnnouncementsController < ApplicationController
	before_action :find_announcement, except: [:new, :create, :index, :author]
	before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
	ANNOUNCEMENTS_PER_PAGE = 3
	##tambien sirve excep: [:new,:create, :index]

	def index
		@page = params.fetch(:page, 0).to_i
  		@announcements = Announcement.offset(@page * ANNOUNCEMENTS_PER_PAGE).limit(ANNOUNCEMENTS_PER_PAGE)
	end
	
	def show
		redirect_to  public_announcement_path(id:@announcement.id)
	end

	def edit
	end

	def update
		@announcement.update(announcement_params)
		redirect_to @announcement
		flash[:notice] = "¡Anuncio actualizado con exito!"
	end

	def new
		@announcement = Announcement.new
	end

	def create
		@announcement = current_user.announcements.create(announcement_params)
		
		
		if @announcement.save
			redirect_to @announcement
			flash[:notice] = "¡Anuncio creado con exito!"
			
		else
			redirect_to announcements_new_path
			flash[:alert] = "¡ups algo esta mal, tu anuncio no fue creado - El titulo debe tener minimo 4 caracteres, el titulo no puede ser repetido!"
		end

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
		Announcement.find(params[:announcement_id])
		params.require(:announcement).permit(:title,:content,:id)
		
	end


end
