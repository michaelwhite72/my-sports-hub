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
    @team_league = @team[:league]
    season = (params[:season])

    ##Team News##
    @team_news = HTTP
      .headers({
        # "X-User-Email" => Rails.application.credentials.aws[:email]},
        "Authorization" => "Bearer #{Rails.application.credentials.news_api[:api_key]}",
      })
      .get("http://newsapi.org/v2/everything?q=#{team_search}&from=2020-10-26&sortBy=publishedAt")
      .parse["articles"]

    ## Adding NCAAF If statement
    if @team_league == "NCAAF"
      @team_stats_ncaaf = HTTP
        .get("https://api.collegefootballdata.com/records?year=2020&team=#{team_api_id}").parse
      @team_logo = HTTP
    else
      @team_stats = HTTP
        .headers({
          "Authorization" => "#{Rails.application.credentials.sportsfeed_api[:api_key]}",
        })
        .get("https://api.mysportsfeeds.com/v2.1/pull/#{@team_league}/#{season}/standings.json?team=#{team_api_id}")
        .parse["teams"]
    end

    render "show.json.jb"
  end
end

