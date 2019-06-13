class TattoosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show], :raise => false
  before_action :set_tattoo, except: [:index, :new, :create]
  before_action :set_artist, only: [:create, :destroy]

  def index
    @tattoos = Tattoo.all
  end

  def show; end

  def new
    @tattoo = Tattoo.new
    @tattoo.build_photo if @tattoo.photo.nil?
    @tattoo.build_taggings if @tattoo.taggings.nil?
    @tags = Tag.all
  end

  def create
    @tattoo = Tattoo.new(tattoo_params)
    @tattoo.artist = current_user.artist

    if @tattoo.save
      redirect_to tattoo_path(@tattoo)
    else
      render :new
    end
  end

  def edit
    @tattoo = Tattoo.find(params[:id])
    @tattoo.build_photo if @tattoo.photo.nil?
    @tattoo.build_taggings if @tattoo.taggings.nil?
    @tags = Tag.all
  end

  def update
    raise
    if @tattoo.update(tattoo_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @tattoo.destroy

    redirect_to users_path(@artist)
  end

  private

  def set_artist
    @artist = current_user
  end

  def set_tattoo
    @tattoo = Tattoo.find(params[:id])
  end

  def tattoo_params
    params.require(:tattoo).permit(:description, :artist_id, photo_attributes: {}, tag_ids: [])
  end
end
