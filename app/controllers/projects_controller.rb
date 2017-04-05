class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
    def new

        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        @project.user = current_user
        if @project.save
          redirect_to team_path(@team)
        else
            render :new
    end
    end

    private

    def project_params
        params.require(:project).permit(:title, :description)
    end
end
