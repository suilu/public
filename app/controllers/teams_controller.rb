class TeamsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  def index
    @teams =Team.all

  end
  def new
    @team = Team.new
  end
  def show
    @team = Team.find(params[:id])
    @projects = @team.projects
  end

  def create
    @team = Team.new(team_params)
    @team.user = current_user

    if @team.save
    redirect_to teams_path
  else
    render :new
  end
end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    flash[:alert] = "Team deleted"
    redirect_to teams_path
  end

  private
  def team_params
    params.require(:team).permit(:title)
  end
end
