class Api::UserTeamsController < ApplicationController
  #
  before_action :authenticate_user

  def index
    @teams = current_user.user_teams.map { |user_team| user_team.team }
    render "index.json.jb"
  end
end
