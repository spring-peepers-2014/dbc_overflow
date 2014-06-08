class AnswersController < ApplicationController
  before_filter :load_question
  before_filter :load_answer, :except => [:new, :create]

  def new
    @answer = @question.answers.build
  end

  def create
    answer = Answer.create(answer_params)
    @question.answers << answer
    redirect_to question_path(@question)
  end

  def edit
  end

  def update
    @answer.update_attributes(answer_params)
    redirect_to question_path(@question)
  end

  def new_comment
    @coment = Comment.new
    render partial: 'comment', locals: { question: @question, answer: @answer }
  end

  def create_comment
    @comment = @answer.comments.build(params[:question])
    if @comment.save
      render partial: 'comment/show', locals: { question: @question, answer: @answer }
    else
      render partial: 'comment', locals: { question: @question, answer: @answer}
    end
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
