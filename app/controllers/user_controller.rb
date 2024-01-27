# app/controllers/users_controller.rb
class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def toggle_dark_mode
      current_user.toggle!(:dark_mode)
      redirect_back(fallback_location: root_path)
    end
  end
  