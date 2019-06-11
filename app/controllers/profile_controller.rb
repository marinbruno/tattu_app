class ProfileController < ApplicationController
  def show
    if user_check
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  private

  def user_check
    User.find(params[:id])
  end
end
