class WatchlistsController < ApplicationController
  before_action :set_watchlist, only: [:show, :update, :destroy]

  def index
    watchlists = Watchlist.all
    render json: watchlists
  end

  def show
    render json: @watchlist
  end

  def create
    watchlist = Watchlist.new(user: User.find(params[:user_id]))

    if watchlist.save
      render json: watchlist, status: :created
    else
      render json: watchlist.errors, status: :unprocessable_entity
    end
  end

  def update
    if @watchlist.update(watchlist_params)
      render json: @watchlist
    else
      render json: @watchlist.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @watchlist.destroy
  end

  private

  def set_watchlist
    @watchlist = Watchlist.find(params[:id])
  end

  def watchlist_params
    params.permit(:user_id)
  end
end
