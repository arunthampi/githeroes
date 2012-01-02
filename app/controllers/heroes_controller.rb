class HeroesController < ApplicationController
  before_filter :authenticate_hero!, :only => [:vote]

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

  def vote
    @votee = Hero.find_by_login(params[:id])
    vote = Vote.create(:votee_id => @votee.id, :voter_id => current_hero.id)

    respond_to do |wants|
      wants.js  { render(vote.persisted? ? :successful_vote : :unsuccessful_vote) }
    end
  end

end
