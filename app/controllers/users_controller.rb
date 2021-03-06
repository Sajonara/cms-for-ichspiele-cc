class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      cookies.signed[:user_id] = user.id
      flash[:notice] = "Herzlich Willkommen #{@user.name} zu IchSpiele."
      redirect_to user_path(@user)
    else
      render 'pages/signup'
    end
  end
  
  def show
    # @user_games = @user.games.paginate / if I wanted to add games and pagination to the user profile
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
    @users = User.paginate(page: params[:page], per_page: 2)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end