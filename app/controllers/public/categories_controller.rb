class Public::CategoriesController < ApplicationController
  #def category
   # @category_method = params[:category_method]
   # @category = Question.find_by(category_method: @category_method)
   # @questions = Question.category
    #render  "/question/category"
  #end


  def index
    @questions = Question.order("created_at DESC").page(params[:page])
  end

  def before
    @before_questions = Question.order("created_at DESC").where(category_method: "before").page(params[:page])
  end

  def breeding
    @breeding_questions = Question.order("created_at DESC").where(category_method: "breeding").page(params[:page])
  end

  def knowledge
    @knowledge_questions = Question.order("created_at DESC").where(category_method: "knowledge").page(params[:page])
  end

  def food
   @food_questions = Question.order("created_at DESC").where(category_method: "food").page(params[:page])
  end
  def illness
    @illness_questions = Question.order("created_at DESC").where(category_method: "illness").page(params[:page])
  end
  def others
   @others_questions = Question.order("created_at DESC").where(category_method: "others").page(params[:page])
  end


end
