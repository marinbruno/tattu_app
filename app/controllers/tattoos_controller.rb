class TattoosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show], :raise => false
  before_action :set_tattoo, except: [:index, :new, :create]
  before_action :set_artist, only: [:create, :destroy]

  def index
    if params[:query].present?
      @tattoos = Tattoo.search_by_all(params[:query])
    else
      @tattoos = Tattoo.all
    end
  end

  def show; end

  def new
    @tattoo = Tattoo.new
  end

  def create
    @tattoo = Tattoo.new(tattoo_params)
    @tattoo.artist = current_user

    if @tattoo.save
      redirect_to tattoo_path(@tattoo)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @tattoo.update(tattoo_params)
      redirect_to tattoo_path(@tattoo)
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
    params.require(:tattoo).permit(:description, :artist_id, :photo)
  end
end
