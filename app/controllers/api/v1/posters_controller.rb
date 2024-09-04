class Api::V1::PostersController < ApplicationController
  def index
    posters = Poster.all
    render json: PosterSerializer.format_poster(posters)
  end
end