 class AnnouncementsController < ApplicationController
	before_action :find_announcement, except: [:new, :create, :index, :author]
	before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
	#before_create :set_expiration_date
	##tambien sirve excep: [:new,:create, :index]

	def index
		@announcements = Announcement.paginate(page: params[:page], per_page: 3).order(id: :desc).where user_id: current_user.id

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
		@announcement = current_user.announcements.new(announcement_params)

		if @announcement.expiration_date >= Date.today
		
		
			if @announcement.save
				redirect_to @announcement
				flash[:notice] = "¡Anuncio creado con exito!"
				
			else
				redirect_to new_announcement_path
				flash[:alert] = "¡ups algo esta mal, tu anuncio no fue creado - El titulo debe tener minimo 4 caracteres, el titulo no puede ser repetido!"
			end

		else
			redirect_to new_announcement_path
			flash[:alert] = "Error de fecha"
		end
	end



	def destroy
		@announcement.destroy
		redirect_to home_index_path
	end

	def author
		@user = User.find(params[:user_id])
	end

	def find_announcement
		@announcement = Announcement.find(params[:id])		
	end

	def announcement_params
		#Announcement.find(params[:announcement_id])
		params.require(:announcement).permit(:title,:content,:id,:expiration_date)
		
	end


end
