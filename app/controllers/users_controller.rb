class UsersController < ApplicationController
    before_action :authenticate_user!
  def destroy
    delete_account
    set_flash_message
    sign_out_user
    redirect_to_sign_in
  end 
  def delete_account
  end
  def set_flash_message
    flash[:notice] = "Your account has been deleted successfully."
  end
  def sign_out_user
    sign_out(current_user)
  end
  def redirect_to_sign_in
    redirect_to new_user_session_path
  end
end
