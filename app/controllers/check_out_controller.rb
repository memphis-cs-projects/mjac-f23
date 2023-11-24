class CheckOutController < ApplicationController
  before_action :authenticate_user!
  def index

    render :show

  end
end
