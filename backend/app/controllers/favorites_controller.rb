class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :update, :destroy]

  def index
    favorites = Favorite.all
    render json: favorites
  end

  def show
    render json: @favorite
  end

  def create
    favorite = Favorite.new(favorite_params)

    if favorite.save
      render json: favorite, status: :created
    else
      render json: favorite.errors, status: :unprocessable_entity
    end
  end

  def update
    if @favorite.update(favorite_params)
      render json: @favorite
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite.destroy
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :release_id)
  end
end
