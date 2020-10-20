class Api::UserTeamsController < ApplicationController
  #
  def index
    @userteams = UserTeam.where(user_id: 2)
    render "index.json.jb"
  end
end
