class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have created book successfully."
      redirect_to user_path(@user.id)
    else
       render :edit
    end
  end




private
 # def sign_up_params
    # ここに :age, :genderを追記
 #   params.permit(:name, :email, :password, :password_confirmation)
 # end


  def user_params
    params.require(:user).permit(:name, :image_icon,:introduction)
  end

end
