class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      cookies.signed[:user_id] = user.id
      flash[:success] = "Du hast Dich eingeloggt."
      redirect_to user
    else
      flash.now[:danger] = "Es ist ein Fehler beim Login aufgetreten."
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Du hast dich ausgeloggt."
    redirect_to root_path
  end
  
end