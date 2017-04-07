class TodosController < ApplicationController

    def new
        @project = Project.find(params[:project_id])
        @todo = Todo.new
    end

    def show
        @project = Project.find(params[:team_id, params[:id]])
      @todos = @project.todos
    end

    def create
        @project = Project.find(params[:project_id])
      @todo = Todo.new(todo_params)
      @todo.project = @project
      @todo.user = current_user
    if  @todo.save
      redirect_to project_path(@project)
    else
      render :new
    end
    end

    private

    def todo_params
        params.require(:todo).permit(:title)
    end
end
