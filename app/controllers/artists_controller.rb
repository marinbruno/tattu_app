class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
    @artist.user = current_user
    @artist.save
    redirect_to edit_profile_path
  end

  def create
    @artist = Artist.new
    @artist.user = current_user
    @artist.save
    redirect_to edit_profile_path
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:description, :instagram_username, photos_attributes: [:photo])
  end
end
