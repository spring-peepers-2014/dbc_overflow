class CommentsController < ApplicationController

  def create
    p params
    if params[:question_id] != nil
      Question.find(params[:question_id]).comments << Comment.create(params[:comment])
      redirect_to :back
    else
    end
  end
end
