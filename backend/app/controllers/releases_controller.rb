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
    params.require(:release).permit(:title, :release_type, :show_id, :year, :result_type, :poster_url)
  end
end
