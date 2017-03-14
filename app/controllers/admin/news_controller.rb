class Admin::NewsController < ApplicationController
  before_action :set_news, only: [:edit, :update, :destroy]
  
  def index
    @news = News.all
  end
  
  def new
    @news = News.new
  end
  
  def create
    @news = News.new(news_params)
    @news.user = User.first
    if @news.save
      flash[:notice] = "Du hast die News erfolgreich hinzugefügt."
      redirect_to news_path(@news)
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @news.update(news_params)
      flash[:notice] = "Du hast die Nachricht erfolgreich aktualisiert."
      redirect_to news_path(@news)
    else
      render 'edit'
    end
  end
  
  def destroy
    @news.destroy
    flash[:notice] = "Du hast #{@news.title} erfolgreich gelöscht."
    redirect_to news_path
  end
  
  private
  
    def set_news
      @news = News.find(params[:id])
    end
  
    def news_params
      params.require(:news).permit(:title, :content, :user_id)
    end
  
end