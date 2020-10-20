class Api::TeamsController < ApplicationController
  ##
  def index
    @teams = Team.all
    render "index.json.jb"
  end

  def show
    @team = Team.find(params[:id])
    render "show.json.jb"
  end
end
