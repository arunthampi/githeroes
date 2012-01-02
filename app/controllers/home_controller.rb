class HomeController < ApplicationController
  def index
    @heroes = Hero.order("RANDOM()").limit(5)
    @topbar = false
  end

  def leaderboard
    if params[:location].present?
      @heroes = Hero.leaderboard_by_location(params[:location])
    else
      @heroes = Hero.leaderboard
    end
  end

end
