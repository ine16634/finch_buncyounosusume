class HomesController < ApplicationController
  def top
    @questions = Question.all
  end

  def about
  end
  
  def rule
  end
end
