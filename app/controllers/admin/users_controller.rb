class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
    end

  #enum is_valid: { '有効': true, '退会済': false }

  def active_for_authentication?
    super && self.is_valid == true
  end

  def check
    user = User.find(params[:id])
    #ユーザーの情報を見つける
  end

  def withdrawl
    user = User.find(params[:id])
    #現在ログインしているユーザーを@userに格納
    user.update(is_valid: false )
    #updateで登録情報を「退会済」に変更
    #reset_session
    #sessionIDのresetを行う
    redirect_to admin_dashboards_path
    #指定されたrootへのpath
  end

  def unwithdrawl
    user = User.find(params[:id])
    #現在ログインしているユーザーを@userに格納
    user.update(is_valid: true )
    #updateで登録情報を「退会済」に変更
    #reset_session
    #sessionIDのresetを行う
    redirect_to admin_dashboards_path
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