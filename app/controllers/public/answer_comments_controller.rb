class Public::AnswerCommentsController < ApplicationController
  
  def create
    answer = Answer.find(params[:answer_id])
    comment = AnswerComment.new(answer_comment_params)
    comment.user_id = current_user.id
    comment.answer_id = answer.id
    comment.save
    redirect_to question_path(params[:question_id])
  end
  
  def destroy
    answer_comment = AnswerComment.find(params[:answer_id])
    answer_comment.user_id = current_user.id
    answer_comment.answer_id = params[:answer_id]
    answer_comment.destroy
    redirect_to question_path
  end
  
  

  private

  def answer_comment_params
    params.require(:answer_comment).permit(:comment, :star)
  end
  
end
