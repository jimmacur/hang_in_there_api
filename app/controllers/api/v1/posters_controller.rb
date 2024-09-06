class Api::V1::PostersController < ApplicationController
  def index
    sort_order = ''

    if params[:sort] == 'asc'
      sort_order = 'ASC'
    else
      sort_order = 'DESC'
    end
    posters = Poster.order(created_at: sort_order)
    # posters = Poster.all
    
    
    render json: PosterSerializer.new(posters, meta: {count: posters.count})

  end

  def show
    poster = Poster.find(params[:id])
      render json: PosterSerializer.new(poster)
  end

  def create
    poster = Poster.create(poster_params)
    render json: PosterSerializer.new(poster)
  end

  def update
    poster = Poster.update(params[:id], poster_params)
    render json: PosterSerializer.new(poster)
  end

  def destroy
    render json: Poster.delete(params[:id])
  end

  private

  def poster_params
    params.require(:poster).permit(:name, :description, :price, :year, :vintage, :img_url)
  end
end