class Admin::UsersController < ApplicationController
  before_action :require_user
  
  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "Der Nutzer wurde gelöscht, und mit ihm alle seine Beiträge."
    redirect_to user_path
  end
  
end