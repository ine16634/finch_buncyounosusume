# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
     user_path(current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private
# アクティブであるかを判断するメソッド
  #def user_state
  # 【処理内容1】 入力されたemailからアカウントを1件取得
  #user = User.find_by(email: params[:user][:email])
  # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
  #　return if user.nil?
  # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
  #　return unless (user.valid_password?(params[:user][:password])&& (user.active_for_authentication? == true))
  #  redirect_to new_user_session_path
  # 【処理内容4】 アクティブでない会員に対する処理

  # end

  def user_state
    user = User.find_by(email: params[:user][:email].downcase)
    if user
      if (!user.valid_password?(params[:user][:password]) || (user.is_valid == false))
        redirect_to new_user_session_path
      end
    end
  end

end
