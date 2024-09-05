class Api::V1::PostersController < ApplicationController
  def index
    posters = Poster.all
    options = {}
    options[:meta] = {count: posters.length}
    render json: PosterSerializer.new(posters, options)
  end

  def show
    poster = Poster.find(params[:id])
    options = {}
    options[:meta] = {count: 1}
    render json: PosterSerializer.new(poster, options)
  end

  def create
    render json: Poster.create(poster_params)
  end

  # def update
  #   render json: Task.update(params[:id], task_params)
  # end

  # def destroy
  #   render json: Task.delete(params[:id])
  # end

  private

  def poster_params
    params.require(:poster).permit(:name, :description, :price, :year, :vintage, :img_url)
  end
end