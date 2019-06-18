class TagsController < ApplicationController
  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @tattoos = @tag.tattoos
  end
end
