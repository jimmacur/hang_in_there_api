class Api::V1::PostersController < ApplicationController
  def index
    posters = Poster.all
    render json: PosterSerializer.format_posters(posters)
  end

  def show
    poster = Poster.find(params[:id])
    render json: PosterSerializer.format_poster(poster)
  end

  # def create
  #   render json: Task.create(task_params)
  # end

  # def update
  #   render json: Task.update(params[:id], task_params)
  # end

  # def destroy
  #   render json: Task.delete(params[:id])
  # end

  # private

  # def task_params
  #   params.require(:task).permit(:title, :description)
  # end
end