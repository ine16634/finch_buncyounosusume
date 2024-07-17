class Public::AnswerCommentsController < ApplicationController
  def create
    answer = Answer.find(params[:Answer_id])
    comment = current_user.answer_comments.new(answer_comment_params)
    comment.answer_id = answer.id
    comment.save
    redirect_to panswer_path(answer)
  end

  private

  def answer_comment_params
    params.require(:answer_comment).permit(:comment)
  end
  
end
