class PersonalInformationController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @back_link = root_path
  end
  def destroy
    redirect_to confirm_account_deletion_path
  end
end
 