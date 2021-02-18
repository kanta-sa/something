class ChoicesController < ApplicationController
  before_action :authenticate_user!

  def update
    @choice = Choice.find(params[:id])
    @question = Question.find(params[:question_id])
    @choice.select_choice
    @question.answer_question(current_user)
    @choices = @question.choices
  end
end
