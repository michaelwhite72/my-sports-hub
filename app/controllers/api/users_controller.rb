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
    ##user tags loop is created for team ids
    if @user.save
      #remove eval on front end build
      if params[:team_ids]
        (params[:team_ids]).each do |team_id|
          UserTeam.create(user_id: @user.id, team_id: team_id)
        end
      end
      render "show.json.jb", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @user = current_user
    render "show.json.jb"
  end

  def update
    @user = User.find(current_user.id)
    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email

    if params[:password]
      @user.password = params[:password]
    end

    ### A password change option-may use if I integrate a modal on the front end
    # if params[:password]
    #   if @user.authenticate(params[:old_password])
    #     @user.update!(
    #       password: params[:password],
    #       password_confirmation: params[:password_confirmation],
    #     )
    #   end
    # end

    if @user.save
      if params[:team_ids]
        @user.user_teams.destroy_all
        (params[:team_ids]).each do |team_id|
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
    user.destroy
    render json: { message: "The user has been successfully deleted!!!" }
  end
end
