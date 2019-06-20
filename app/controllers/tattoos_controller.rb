class TattoosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show], :raise => false
  before_action :set_tattoo, except: [:index, :new, :create]
  before_action :set_artist, only: [:create, :destroy]

  include Pagy::Backend

  def index
    if params[:query].present?
      @pagy, @tattoos = pagy(Tattoo.search_by_all(params[:query]).random, page: params[:page])
    else
      @pagy, @tattoos = pagy(Tattoo.random, page: params[:page])
    end
  end

  def show
    @tags = @tattoo.tags

    results = []
    @tags.each do |tag|
      results << Tattoo.search_by_all(tag.name)
    end
    results = results.flatten

    @relate_tattoos = results.first(5)
  end

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
      redirect_to profile_path
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
    if @tattoo.update(tattoo_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @tattoo.destroy

    redirect_to profile_path(current_user)
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
