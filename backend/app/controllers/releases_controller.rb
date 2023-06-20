class ReleasesController < ApplicationController
  before_action :set_release, only: [:show, :update, :destroy]

  def index
    releases = Release.all
    render json: releases
  end

  def show
    render json: @release
  end

  def create
    release = Release.new(release_params)

    if release.save
      render json: release, status: :created
    else
      render json: release.errors, status: :unprocessable_entity
    end
  end

  def update
    if @release.update(release_params)
      render json: @release
    else
      render json: @release.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @release.destroy
  end

  private

  def set_release
    @release = Release.find(params[:id])
  end

  def release_params
    params.require(:release).permit(:title, :type, :tmdb_id, :tmdb_type, :imdb_id, :season_number, :poster_url, :source_release_date, :source_id, :source_name, :is_original, :watchlist_id)
  end
end
