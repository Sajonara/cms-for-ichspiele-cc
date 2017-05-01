class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.all

    respond_to do |format|
      format.html
      format.xml { render layout: false }
    end
  end

end
