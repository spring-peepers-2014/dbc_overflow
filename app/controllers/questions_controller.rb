class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    p question_params
    question = Question.create(question_params)
    redirect_to question_path(question)
  end

  def update
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:name, :body)
  end

end
