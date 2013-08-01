class TrackVisitsController < ApplicationController
  def create
    saw params[:doing]
    head :ok
  end
end
