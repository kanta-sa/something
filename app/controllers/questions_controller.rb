class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = current_user.questions.new
  end

  def create
  end
end
