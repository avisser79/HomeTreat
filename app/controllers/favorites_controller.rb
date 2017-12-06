class FavoritesController < ApplicationController
  def index
    @favorites = policy_scope(Favorite)
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user == current_user
    authorize @favorite
    @favorite.save
  end

  def update
    @favorite = Favorite.find(params[:id])
    authorize @favorite
    @favorite.update(favorite_params)

  end

  def destroy
    @favorite = Favorite.find(params[:id])
    authorize @favorite
    @favorite.destroy!
  end

  private

  def favorite_params
    params.require(:favorite).permit(:comment, :specialist_id)
  end
end
