class CommentsController < ApplicationController

  # def new

  # end

#   def create
#     p params
#     if params[:question_id] != nil
#       Question.find(params[:question_id]).comments << Comment.create(params[:comment])
#       redirect_to :back
#     else
#     end
#   end
# end

  def new
    p "These are the params: #{params.inspect}"
    if !params[:answer_id].nil?
      @commentable = Answer.find params[:answer_id]
    elsif !params[:question_id].nil?
      @commentable = Question.find params[:question_id]
    end

    raise ActiveRecord::RecordNotFound if @commentable.nil?
  end

  def create
    @commentable = Commentable.new :params[:comment]
      render :new
  end
end
