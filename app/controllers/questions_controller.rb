class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @choices = @question.choices
  end

  def new
    @question = current_user.questions.new
    @question.choices.build
    @genres = Genre.all
  end

  def create
    @question = current_user.questions.build(question_params)
    @question.genre_id = Genre.find_by(id: params[:question][:genre]).id
    if @question.save
      flash[:notice] = 'アンケートを作成しました。'
      redirect_to questions_path
    else
      @genres = Genre.all
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, choices_attributes: [:content, :_destroy])
  end
end
