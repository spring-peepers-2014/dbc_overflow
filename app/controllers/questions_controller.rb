class QuestionsController < ApplicationController
  before_filter :load_question, :except => [:index, :new, :create]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    p "These are the params for questions #{params}"
    @answers = @question.answers
    @answer = Answer.new
  end

  def edit
  end

  def create
    question = Question.create(question_params)
    redirect_to question_path(question)
  end

  def update
    @question.update_attributes(question_params)
    redirect_to question_path(@question)
  end

  private

  def question_params
    params.require(:question).permit(:name, :body)
  end

  def load_question
    @question = Question.find(params[:id])
  end

end
