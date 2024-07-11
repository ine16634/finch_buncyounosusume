class Public::HomesController < ApplicationController
  
  def top
    @questions = Question.order("created_at DESC").page(params[:page]).per(5)
  end

  def about
  end
  
  def rule
  end
end
