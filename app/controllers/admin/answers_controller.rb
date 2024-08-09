class Admin::AnswersController < ApplicationController
   layout 'admin'
  
  def index
    @answers = Answer.all
  end
  
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to admin_answers_path, notice: '削除しました'
  end
  
end
