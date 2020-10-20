class Api::UsersController < ApplicationController
  #
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
    @user = User.find(params[:id])
    render "show.json.jb"
  end

  def update
    @user = User.find(params[:id])

    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email
    @user.password = params[:password] || @user.password
    @user.password_confirmation = params[:password_] || @user.password_confirmation

    if @user.save
      @user.user_teams.destroy_all
      #remove eval on front end build
      eval(params[:team_ids]).each do |team_id|
        UserTeam.create(user_id: @user.id, team_id: team_id)
      end
      render "show.json.jb", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: "The user has been successfully deleted!!!" }
  end
end
