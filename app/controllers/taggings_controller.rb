class TaggingsController < ApplicationController
  def new
    @tags = Tagging.new
  end

  def save
    raise
  end

  private

  def tagging_params
    params.require(:taggings).permit(:tag, :tattoo)
  end

end
