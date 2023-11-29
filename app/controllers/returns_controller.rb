# app/controllers/returns_controller.rb

class ReturnsController < ApplicationController
  before_action :set_order

  def new
    @return = Return.new
  end

  def create
    @return = Return.new(return_params)
    @return.order = @order

    if @return.save
      # Implement any necessary logic here (e.g., send confirmation email)

      # Destroy the order after creating the return
      @order.destroy

      redirect_to root_path, notice: 'Return request submitted successfully. Order destroyed.'
    else
      render :new
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def return_params
    # Make sure to adjust this based on your actual return model attributes
    params.require(:return).permit(:reason, :status)
  end
end
