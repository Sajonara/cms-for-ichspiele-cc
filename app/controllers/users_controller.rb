class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Herzlich Willkomemen #{@user.name} zu IchSpiele."
      redirect_to user_path(@user)
    else
      render 'pages/signup'
    end
  end
  
  def show
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end