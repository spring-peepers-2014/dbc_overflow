class CommentsController < ApplicationController

  #this is going connect to new.html.erb which holds the comment form
  def new
    @comment = Comment.new
  end

  #this handles the post request after a comment is submitted
  #use ajax to append the comment(?)
  def create
    @comment = Comment.create(params[:comment])
  end



end
