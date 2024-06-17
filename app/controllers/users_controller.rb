class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end




private
  def sign_up_params
    # ここに :age, :genderを追記
    params.permit(:name, :email, :password, :password_confirmation)
  end


  def user_params
    params.require(:user).permit(:name, :image_icon,:introduction)
  end

end
