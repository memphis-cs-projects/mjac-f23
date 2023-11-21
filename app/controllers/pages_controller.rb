class PagesController < ApplicationController
    def home
        render :home
    end 
    def sign_out
        render :sign_out
        redirect_to root_path, notice: 'sign out done'
    end 

        
end
