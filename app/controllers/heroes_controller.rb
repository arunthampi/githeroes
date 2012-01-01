class HeroesController < ApplicationController
  def show
    @hide_footer = true
    @hero = Hero.find_by_login(params[:id])
  end

  def create
    hero_params = params[:hero]
    if (@hero = Hero.find_by_login(hero_params[:login])).blank?
      @hero = Hero.from(hero_params)
      @hero.save
    end
  end
end
