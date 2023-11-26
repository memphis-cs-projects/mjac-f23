class PersonalInformationController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    Rails.logger.debug("User: #{@user.inspect}")
  end
end
 