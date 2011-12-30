class HeroesController < ApplicationController
  def show
    @hero = Hero.find_by_login(params[:id])
  end
end
