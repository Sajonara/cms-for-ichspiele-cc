class Admin::GamesController < ApplicationController
  
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
    @game = Game.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = "Du hast das Spiel erfolgreich aktualisiert."
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:notice] = "Du hast #{@game.name} erfolgreich gelöscht."
    redirect_to games_path
  end
  
  private
  
    def game_params
      params.require(:game).permit(:name, :release_germany)
    end
  
end