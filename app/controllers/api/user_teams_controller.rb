class Api::UserTeamsController < ApplicationController
  #
  before_action :authenticate_user

  def index
    @userteams = UserTeam.where(user_id: current_user.id)
    render "index.json.jb"
  end
end
