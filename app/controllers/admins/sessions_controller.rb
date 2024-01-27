class Admins::SessionsController < Devise::SessionsController
    layout false
    # before_action :configure_sign_in_params, only: [:create]
    def after_sign_in_path_for(resource)
      admins_dashboards_path
    end
  end