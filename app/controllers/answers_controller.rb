class AnswersController < ApplicationController
  before_filter :load_question
  before_filter :load_answer, :except => [:new, :create]

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = Answer.new(answer_params)
    @user = User.find(session[:user_id])
    @answer.user_id = @user.id
    @answer.save
    @question.answers << @answer
    redirect_to question_path(@question)
  end

  def edit
  end

  def update
    @answer.update_attributes(answer_params)
    redirect_to question_path(@question)
  end

  def new_comment
    @comment = Comment.new
    render partial: 'answers/comment', locals: { question: @question, answer: @answer, comments: @comment }
  end

  def create_comment
    @comment = @answer.comments.build(params[:answer])
    if @comment.save
      render partial: 'comments/show', locals: { comment: @comment }
    else
      render partial: 'answers/comment', locals: { question: @question, answer: @answer, comments: @comment }
    end
  end

  def vote
    @vote = @answer.votes.build(vote_value: params[:vote_value])
    @vote.save
    redirect_to question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def load_question
    @question = Question.find(params[:question_id])
  end

  def load_answer
    @answer = Answer.find(params[:id])
  end

end
