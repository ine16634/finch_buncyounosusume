class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @questions = @user.questions
    @answers = @user.answers
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

  #enum is_valid: { '有効': true, '退会済': false }

  def active_for_authentication?
    super && self.is_valid == true
  end
  
  def check
    @user = User.find(params[:id])
    #ユーザーの情報を見つける
  end
  
  def withdrawl
    @user = User.find(current_user.id)
    #現在ログインしているユーザーを@userに格納
    @user.update(is_valid: false )
    #updateで登録情報を「退会済」に変更
    reset_session
    #sessionIDのresetを行う
    redirect_to root_path
    #指定されたrootへのpath
  end
 
 
 



private
 # def sign_up_params
    # ここに :age, :genderを追記
 #   params.permit(:name, :email, :password, :password_confirmation)
 # end


  def user_params
    params.require(:user).permit(:name, :image_icon, :introduction, :valid)
  end

end
