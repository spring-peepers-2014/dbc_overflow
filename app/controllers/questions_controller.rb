class QuestionsController < ApplicationController
  before_filter :load_question, :except => [:index, :new, :create]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    if session[:user_id] == nil
      redirect_to user_login_path
    end
  end

  def show
    @answers = @question.answers
    @answer = Answer.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @user = User.find(session[:user_id])
    @question.user = @user
    @question.save
    redirect_to question_path(@question)
  end

  def update
    @question.update_attributes(question_params)
    redirect_to question_path(@question)
  end

  def new_comment
    @comment = Comment.new
    render partial: 'questions/comment', locals: { question: @question, comment: @comment }
  end

  def create_comment
    @user = User.find(session[:user_id])
    @comment = @question.comments.build(params[:question])
    @comment.user = @user
    if @comment.save
      render partial: 'comments/show', locals: { comment: @comment }
    else
      render partial: 'comment', locals: { question: @question }
    end
  end

  def vote
    @vote = @question.votes.build(vote_value: params[:vote_value])
    @vote.user = User.find(session[:user_id])
    @vote.save
    render json: @question.votes.sum(:vote_value).to_s
  end

  private

  def question_params
    params.require(:question).permit(:name, :body)
  end

  def load_question
    @question = Question.find(params[:id])
  end

end
