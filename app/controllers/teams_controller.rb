class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.friendly.find(params[:id])
  end
end
