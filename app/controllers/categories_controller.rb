class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
    @category = Category.new
    @category.todos.build
  end

  def show
    @category = Category.find(params[:id])
    @todos = @category.todos
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:notice] = "カテゴリーを追加しました"
      redirect_to categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, todos_attributes: [:content])
  end
end
