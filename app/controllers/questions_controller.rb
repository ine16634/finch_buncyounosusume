class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  #def confirm
    # @question = Question.new(question_params)
    #if @question.invalid? #入力項目に空のものがあれば入力画面に遷移
     # render :new
    #end
  #end

   def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
    #  flash[:notice] = "You have created book successfully."
      redirect_to @question
    else
      render :new and return
    end
   end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to '/questions'
  end



  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

private
    def question_params
      params.require(:question).permit(:question_content)
    end
end
