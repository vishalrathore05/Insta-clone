class Admins::UsersController < Admins::BaseController
    before_action :get_user, only: [:show, :block, :unblock]
    def index
      @users = User.all
      respond_to do |format|
        format.html
        format.json {
          render json: UserDatatable.new(view_context, { recordset: @users }) }
      end
    end
  
    def block
      if @user.access_locked? # Check if the user is already locked
        flash[:alert] = 'This user is already blocked.'
      else
        @user.lock_access! # Lock the user
        flash[:notice] = 'User has been successfully blocked.'
      end
      redirect_to admins_users_path
    end
  
    def unblock
      if @user.access_locked?
        @user.unlock_access! # Unlock the user
        flash[:notice] = 'User account has been unblocked successfully.'
      else # Check if the user is already unlocked
        flash[:alert] = 'User account is already active.'
      end
      redirect_to admins_users_path
    end
  
    private
  
    def get_user
      @user = User.find_by(id: params[:id])
    end
  end