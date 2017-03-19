class PagesController < ApplicationController
  
  def home
    
  end
  
  def about
    
  end
  
  def help
    
  end
  
  def signup
    @user = User.new
  end
end