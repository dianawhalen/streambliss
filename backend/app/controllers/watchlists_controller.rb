class WatchlistsController < ApplicationController
  def index
    watchlists = User.all
    render json: watchlists
  end

  def show
    watchlist = User.find(params[:id])
    render json: watchlist
  end
end
