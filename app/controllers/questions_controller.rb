class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = current_user.questions.new
    @question.choices.build
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:notice] = 'アンケートを作成しました。'
      redirect_to questions_path
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, choices_attributes: [:content, :_destroy])
  end
end
