class ArtistsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @artists = Artist.all.shuffle
    @markers = []
    @artists.each do |artist|
      @markers1 = artist.places.map do |place|
        {
          lat: place.latitude,
          lng: place.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { place: place }),
          image_url: helpers.asset_url('heart.svg')
        }
      end
      if @markers1.size > 0
        @markers1.each do |mark|
          @markers << mark
        end
      end
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @markers = @artist.places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { place: place }),
        image_url: helpers.asset_url('heart.svg')
      }
    end
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

  def contact
    @artist = Artist.find(params[:id])
    UserMailer.contact(@artist, current_user).deliver_now
  end

  def destroy
    @artist = current_user.artist
    @artist.destroy
    redirect_to profile_path(current_user)
  end

  private

  def artist_params
    params.require(:artist).permit(:description, :instagram_username, photos_attributes: [:photo])
  end
end
