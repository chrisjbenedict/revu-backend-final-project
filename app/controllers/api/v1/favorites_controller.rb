class Api::V1::FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
    render json: @favorites
  end

  def show
    @favorite = Favorite.find(params[:id])
    render json: @favorite, status: :ok
  end

  def create
    @favorite = Favorite.create(favorite_params)
    render json: @favorite, status: :created
  end

  def update
    @Favorite = Favorite.find(params[:id])
    @Favorite.update(favorite_params)
    render json: @Favorite, status: :accepted
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.delete
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :college_id, :ranking, :app_started, :essay, :app_submitted)
  end

end
