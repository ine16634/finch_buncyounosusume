class Admin::QuestionsController < ApplicationController
   layout 'admin'

  def index
    @questions = Question.all
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_questions_path, notice: '削除しました'
  end
  
end
