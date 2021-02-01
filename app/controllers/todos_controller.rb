class TodosController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @todo = Todo.new(todo_params)
    @todo.category_id = @category.id
    if @todo.save
      flash[:notice] = 'TODOを追加しました'
      redirect_to category_path(@category)
    else
      @categories = Category.all
      render 'categories/index'
    end
  end

  def update
    @todo = Todo.find_by(id: params[:id])
    @categories = Category.all
    @category = Category.new
    @category.todos.build
    if params[:flg]
      if @todo.update_attributes(status: 'done')
        redirect_to categories_path
      else
        render 'categories/index'
      end
    else
      render 'categories/index'
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :content, :category_id)
  end
end
