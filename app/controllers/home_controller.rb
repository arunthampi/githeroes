class HomeController < ApplicationController
  def index
    @heroes = Hero.order("RANDOM()").limit(5)
    @topbar = false
  end
end
