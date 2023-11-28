class PersonalInformationController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @back_link = root_path
  end
  def destroy
    @user = current_user
    @user.destroy
    sign_out(@user) 
    redirect_to root_path, notice: 'Account deleted successfully.'
  end
end
 