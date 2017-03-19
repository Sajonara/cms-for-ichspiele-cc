class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Herzlich Willkommen #{@user.name} zu IchSpiele."
      redirect_to user_path(@user)
    else
      render 'pages/signup'
    end
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = "Dein Profil wurde erfolgreich aktualisiert."
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def index
    @users = User.all
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end