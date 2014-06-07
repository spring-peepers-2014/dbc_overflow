class AnswersController < ApplicationController

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
    redirect_to question_path(question)
  end


  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
