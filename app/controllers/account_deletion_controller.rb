class AccountDeletionController < ApplicationController
    before_action :authenticate_user!
    def confirm
         @delete_reasons = ['Find better store', 'Expensive prices', 'Bad customer service', 'No Longer Needed' ]
         @show_additional_reasons = true 
    end
  
    def destroy
      if params[:confirm_delete] == 'true'
        current_user.destroy
        sign_out(current_user)
        redirect_to new_user_session_path, notice: 'Account deleted successfully.'
      else
        redirect_to confirm_account_deletion_path, alert: 'Account deletion cancelled.'
      end
    end
  end


