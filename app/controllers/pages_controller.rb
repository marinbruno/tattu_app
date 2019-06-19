class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home], raise: false

  def home
    @tags = Tag.all
    @tag = @tags.sample
  end
end
