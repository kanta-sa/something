class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @genres = Genre.search(params[:search])
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
    @genre = Genre.find_by(id: params[:question][:genre])
    if @genre.nil?
      if params[:question][:genre_name].blank?
        @genre = Genre.find_by(name: 'その他')
      else
        @genre = Genre.new(name: params[:question][:genre_name])
        @genre.save
      end
    end
    @question.genre_id = @genre.id
    if @question.save
      flash[:notice] = 'アンケートを作成しました。'
      redirect_to questions_path
    else
      @genre.errors.full_messages.each do |msg|
        @question.errors.add(:base, msg)
      end
      @question.errors.delete(:genre)
      @genres = Genre.all
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, choices_attributes: [:content, :_destroy])
  end
end
