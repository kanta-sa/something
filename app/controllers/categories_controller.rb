class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
    @category = Category.new
    @category.todos.build
  end

  def show
    @category = Category.find(params[:id])
    @todos = @category.todos
    @todo = Todo.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:notice] = 'カテゴリーを追加しました'
      redirect_to categories_path
    else
      @categories = current_user.categories
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, todos_attributes: [:title, :content])
  end
end
