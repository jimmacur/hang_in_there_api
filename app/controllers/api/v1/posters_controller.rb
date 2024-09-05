class Api::V1::PostersController < ApplicationController
  def index
    posters = Poster.all
    options = {}
    options[:meta] = {count: posters.length}
    render json: PosterSerializer.new(posters, options)
  end

  def show
    poster = Poster.find(params[:id])
    render json: PosterSerializer.new(poster)
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