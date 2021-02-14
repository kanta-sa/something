class ChoicesController < ApplicationController
  def update
    @choice = Choice.find(params[:id])
    @question = Question.find(params[:question_id])
    cnt = @choice.ans_cnt
    @choice.update_attributes(ans_cnt: cnt + 1)
    @question.answer_question(current_user)
    @choices = @question.choices
  end
end
