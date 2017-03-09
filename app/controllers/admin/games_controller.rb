class Admin::GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update, :destroy]
  
  def index
  end
  
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = "Du hast erfolgreich ein Spiel hinzugefügt."
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @game.update(game_params)
      flash[:notice] = "Du hast das Spiel erfolgreich aktualisiert."
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end
  
  def destroy
    @game.destroy
    flash[:notice] = "Du hast #{@game.name} erfolgreich gelöscht."
    redirect_to games_path
  end
  
  private
  
    def set_game
      @game = Game.find(params[:id])
    end
  
    def game_params
      params.require(:game).permit(:name, :release_germany)
    end
  
end