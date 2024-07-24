class Public::CategoriesController < ApplicationController
  #def category
   # @category_method = params[:category_method]
   # @category = Question.find_by(category_method: @category_method)
   # @questions = Question.category
    #render  "/question/category"
  #end
  
  
  def index
    @questions = Question.order("created_at DESC").page(params[:page])
    
    @a_type_questions = User.A
    @b_type_questions = User.B
    @a_type_questions = User.A
    @b_type_questions = User.B
    
    
  end
  
  
end
