class ProjectsController < ApplicationController
  def index
      @team = Team.find(params[:team_id])
      @projects = Project.all
  end
    def new
      @team = Team.find(params[:team_id])
        @project = Project.new
    end

    def show
      @project = Project.find_by(team_id: params[:id])
    end

    def create
      @team = Team.find(params[:team_id])
      @project = Project.new(project_params)
      @project.team = @team
      @project.user = current_user
    if  @project.save
      redirect_to team_path(@team)
    else
      render :new
    end
    end

    def destroy
      @team = Team.find(params[:team_id])
        @project = Project.find_by(team_id: params[:id])
        @project.destroy
        flash[:alert] = "Group deleted"
        redirect_to team_path(@team)
    end

    private

    def project_params
        params.require(:project).permit(:title, :description)
    end
end
