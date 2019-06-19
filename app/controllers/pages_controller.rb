class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home], raise: false

  def home
    @tattoos = Tattoo.all
  end
end
