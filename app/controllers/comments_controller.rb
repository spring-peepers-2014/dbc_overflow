class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @comment.commentable = @commentable

    respond_to do |format|
      if @comment.save
        p "Successful"
      else
      end
  end

  private
  def get_object
    type = ''
    if params[:question_id]; type = 'question'
    elsif params[:answer_id]; type = 'answer'
    end
    value = type.classify.constantize.find_by_identifier(params[:"#{type}_id"])
    instance_variable_set("@commentable" , value)
  end
end
