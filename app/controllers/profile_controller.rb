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
    @user.build_artist if @user.artist.nil?
    @user.build_photo if @user.photo.nil?
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
