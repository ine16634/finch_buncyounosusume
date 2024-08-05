class Admin::SearchesController < ApplicationController
   layout 'admin'

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @questions = Question.looks(params[:search], params[:word])
    end
  end
end
