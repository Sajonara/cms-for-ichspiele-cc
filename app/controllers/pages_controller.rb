class PagesController < ApplicationController
  
  def home
    redirect_to admin_root_path if is_admin?
    redirect_to user_path if logged_in? && !is_admin?
  end
  
  def about
    
  end
  
  def help
    
  end
  
  def signup
    @user = User.new
  end
end