class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Du hast die Nachricht erfolgreich hinzugefügt."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  # methods to edit an existing article
  def edit
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "Du hast die Nachricht erfolgreich aktualisiert."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    @article.destroy
    flash[:success] = "Du hast #{@article.title} erfolgreich gelöscht."
    redirect_to admin_article_path
  end
  
  private
  
    def set_article
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :content, :user_id)
    end
  
end