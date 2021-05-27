class RegistrationsController < Devise::RegistrationsController
   #layout "device"

  private
  def sign_up_params
    params.require(:user).permit(:name,:lastname, :username, :email, :password, :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:name,:lastname, :username, :email, :password, :password_confirmation, :current_password)
  end



  def user_params
    params.require(:user).permit(:name,:lastname, :username, :email, :password, :password_confirmation, :current_password)
  end
end