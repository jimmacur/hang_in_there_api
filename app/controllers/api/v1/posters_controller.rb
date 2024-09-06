class Api::V1::PostersController < ApplicationController
  def index
  
    if params[:name].present?
      posters = Poster.where("name ILIKE ?", "%#{params[:name]}%").order("name ASC")
    elsif params[:sort].present?
      posters = Poster.order(created_at: params[:sort])
    # elsif params[:max_price]

    # elsif params[:min_price]

    else
      posters = Poster.order(created_at: "ASC")
    end

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