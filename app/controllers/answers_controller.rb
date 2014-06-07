class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    answer = Answer.create(answer_params)
    question = Question.find(params[:question_id])
    question.answers << answer
    redirect_to question_answers_path(question)
  end


  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
