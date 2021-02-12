class ChoicesController < ApplicationController
  def update
    @choice = Choice.find(params[:id])
    @question = Question.find(params[:question_id])
    cnt = @choice.ans_cnt
    if @choice.update_attributes(ans_cnt: cnt+1)
      redirect_to question_path(@question)
    else
      @choices = @question.choices
      render 'questions/show'
    end
  end
end
