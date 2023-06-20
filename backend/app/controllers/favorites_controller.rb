class FavoritesController < ApplicationController
  def index
    favorites = User.all
    render json: favorites
  end

  def show
    favorite = User.find(params[:id])
    render json: favorite
  end
end
