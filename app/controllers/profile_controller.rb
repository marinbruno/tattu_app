class ProfileController < ApplicationController
  def show
    if params.has_key?(:id)
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def edit
    @user = current_user
    @user.build_photo
    @user.build_artist

    # if current_user.photo.nil?
    #   @photo = Photo.new
    # else
    #   @photo = current_user.photo
    # end

    # if current_user.artist.nil?
    #   @artist = Artist.new
    # else
    #   @artist = current_user.artist
    # end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :name, :photo, :description, :instagram_username,
      photo_attributes: {}, artist_attributes: {}
    )
  end
end
