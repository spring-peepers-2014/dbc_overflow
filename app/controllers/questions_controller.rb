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
    question = Question.create(name: params[:name])
  end

  def update
    @question = Question.find(params[:id])
  end

end
