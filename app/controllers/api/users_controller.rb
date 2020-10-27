class Api::UsersController < ApplicationController
  #
  before_action :authenticate_user, except: :create

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )

    if @user.save
      #remove eval on front end build
      eval(params[:team_ids]).each do |team_id|
        UserTeam.create(user_id: @user.id, team_id: team_id)
      end
      render "show.json.jb", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @user = User.find(current_user.id)
    # user_teams = user.teams
    # schedule = {} ##there will be a team key, and a array of hashes for each key value
    #looping thru user teams with an each loop
    #setting the response data to key & data
    ### USER TEAM INFO SHOW
    # team_api_id = @team[:api_id]
    # team_league = @team[:league]

    # @team_game_info = HTTP
    #   .headers({
    #     # "X-User-Email" => Rails.application.credentials.aws[:email]},
    #     "Authorization" => "#{Rails.application.credentials.sportsfeed_api[:api_key]}",
    #   })
    #   .get("https://api.mysportsfeeds.com/v2.1/pull/nba/latest/games.json?team=DET")
    #   .parse["games"]

    render "show.json.jb"
  end

  def update
    @user = User.find(current_user.id)

    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email

    if params[:password]
      if @user.authenticate(params[:old_password])
        @user.update!(
          password: params[:password],
          password_confirmation: params[:password_confirmation],
        )
      end
    end

    if @user.save
      if params[:team_ids]
        @user.user_teams.destroy_all
        #remove eval on front end build
        eval(params[:team_ids]).each do |team_id|
          UserTeam.create(user_id: @user.id, team_id: team_id)
        end
      end
      render "show.json.jb", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    user = User.find(current_user.id)
    # user = User.find(params[:id])
    user.destroy
    render json: { message: "The user has been successfully deleted!!!" }
  end
end
