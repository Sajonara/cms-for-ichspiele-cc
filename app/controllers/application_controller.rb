class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :admin_user, :logged_in?, :is_admin?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def admin_user
    @admin_user ||= User.find(session[:user_id]).is_admin if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def is_admin?
    !!admin_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "Du musst eingeloggt sein, um diese Aktion auszuführen."
      redirect_to root_path
    end
  end
  
  def require_admin
    if !is_admin?
      flash[:danger] = "Du benötigst Admin-Rechte, um diese Aktion auszuführen."
      redirect_to root_path 
    end
  end
  
end
