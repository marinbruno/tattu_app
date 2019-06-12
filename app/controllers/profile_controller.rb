class ProfileController < ApplicationController
  def show
    if user_check
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def edit
    @user = current_user
    @photo = Photo.new
    @artist = Artist.new

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
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to
    else
      render :new
    end
  end

  private

  def user_check
    User.find(params[:id])
  end

end
