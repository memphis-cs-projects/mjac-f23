class PagesController < ApplicationController
    before_action :find_user, only: [:edit, :update]

    def home
        render :home
    end
    def new
        # Render the form to enter the email for password reset
      end

      def create
        @user = User.find_by(email: params[:email])

        if @user
          redirect_to edit_password_reset_path(@user)
        else
          flash.now[:alert] = 'User not found.'
          render :new
        end
      end



      def edit
        # Render the form to enter a new password
      end

      def update
        if @user.update(user_params)
          # Password updated successfully
          redirect_to root_path, notice: 'Password updated successfully.'
        else
          render :edit
        end
      end

      private

      def find_user
        @user = User.find_by(reset_password_token: params[:id])

        if @user && @user.reset_password_sent_at > 2.hours.ago
          # Token is valid
        else
          # Token is expired or invalid
          redirect_to new_password_reset_path, alert: 'Password reset link has expired. Please request a new one.'
        end
      end

      def user_params
        params.require(:user).permit(:password, :password_confirmation)
      end

      #shop
      def shop
        render :shop
      end

    end
