class ReleasesController < ApplicationController
  def index
    releases = User.all
    render json: releases
  end

  def show
    release = User.find(params[:id])
    render json: release
  end
end
