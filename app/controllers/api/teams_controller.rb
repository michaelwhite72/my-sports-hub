class Api::TeamsController < ApplicationController
  ##
  def index
    @teams = Team.all
    render "index.json.jb"
  end

  def show
    @team = Team.find(params[:id])
    team_search = @team[:name].gsub(" ", "%20")
    team_api_id = @team[:api_id]
    team_league = @team[:league]
    @team_news = HTTP
      .headers({
        # "X-User-Email" => Rails.application.credentials.aws[:email]},
        "Authorization" => "Bearer #{Rails.application.credentials.news_api[:api_key]}",
      })
      .get("http://newsapi.org/v2/everything?q=#{team_search}&sortBy=publishedAt")
      .parse["articles"]

    # @team_game_time = HTTP
    #   .headers({
    #     # "X-User-Email" => Rails.application.credentials.aws[:email]},
    #     "Authorization" => "#{Rails.application.credentials.sportsfeed_api[:api_key]}",
    #   })
    #   .get("https://api.mysportsfeeds.com/v2.1/pull/#{team_league}/2020-2021-regular/games.json?team=#{team_api_id}")
    #   .parse["games"]

    @team_stats = HTTP
      .headers({
        # "X-User-Email" => Rails.application.credentials.aws[:email]},
        "Authorization" => "#{Rails.application.credentials.sportsfeed_api[:api_key]}",
      })
      .get("https://api.mysportsfeeds.com/v2.1/pull/#{team_league}/2019-2020-regular/standings.json?team=#{team_api_id}")
      .parse["teams"]

    render "show.json.jb"
  end
end

# https://api.mysportsfeeds.com/v2.1/pull/nba/{season}/games.{format}
# [0]["team"]
# https://api.mysportsfeeds.com/v2.1/pull/nba/2019-2020-regular/standings.json?team=DAL
