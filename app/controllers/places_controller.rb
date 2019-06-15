class PlacesController < ApplicationController
  def create
    place = Place.new(place_params)
    place.artist = current_user.artist
    place.save
    redirect_to profile_path
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    redirect_to profile_path
  end

  private

  def place_params
    params.require(:place).permit(:address, :profile_id)
  end
end
