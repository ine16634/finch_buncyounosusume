class Public::AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @answer.question_id = params[:question_id]
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
    if @answer.save
      #flash[:notice] = "成功！"
      redirect_to("/questions/#{params[:question_id]}")
    else
      @question = Question.find(params[:question_id])
      #flash.now[:alert] = "失敗！"
       render :new
    end
  end
  
  def destroy
    answer = Answer.find(params[:question_id])
    answer.user_id = current_user.id
    answer.question_id = params[:question_id]
    answer.destroy
    redirect_to question_path
  end
  

  private
    def answer_params
      params.require(:answer).permit(:answer_content,:image)
    end
end
