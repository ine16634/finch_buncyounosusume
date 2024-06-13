class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @image_icons = @user.image_icons.page(params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
  end
end
