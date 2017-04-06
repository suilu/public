class TodosController < ApplicationController
  def index
    @project = Project.params[:id]
    @todos = Todo.all
  end

  def show
    @todes = Todo.find(params[:id])
  end

  def new

  end

  def create

  end
end
