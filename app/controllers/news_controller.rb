class NewsController < ApplicationController
  
  def show
    @news = News.find(params[:id])
  end
  
  def index
    @news = News.all
  end
  
end