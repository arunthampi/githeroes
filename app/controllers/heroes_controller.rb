class HeroesController < ApplicationController
  def show
    @hero = Hero.find_by_login(params[:id])
  end

  def create
    puts "Format: #{params[:format]}"
    puts "Heroeeee -> #{params[:hero]}"
  end
end
