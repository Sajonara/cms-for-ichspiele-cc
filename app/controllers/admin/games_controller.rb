class Admin::GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update, :destroy]
  
  # methods to create a new game
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      flash[:notice] = "Du hast erfolgreich ein Spiel hinzugefügt."
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end
  
  # methods to edit an existing game
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
  
  # method to delete a game
  def destroy
    @game.destroy
    flash[:notice] = "Du hast #{@game.name} erfolgreich gelöscht."
    redirect_to admin_games_path
  end
  
  # method to list all games in the admin panel
  def index
    @games = Game.paginate(page: params[:page], per_page: 10) # list 10 games per page
  end
  
  private
  
    def set_game
      @game = Game.find(params[:id])
    end
  
    # only these parameters are allowed to being submitted via form
    def game_params
      params.require(:game).permit(:name, :release_germany, :usk, :user_id)
    end
  
end