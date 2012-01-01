class HeroesController < ApplicationController
  def show
    @hide_footer = true
    @hero = Hero.find_by_login(params[:id])
  end

  def create
    hero_params = params[:hero]
    if (@hero = Hero.find_by_login(hero_params[:login])).blank?
      @hero = Hero.new(
                        :login => hero_params[:login],
                        :email => hero_params[:email],
                        :company => hero_params[:company],
                        :location => hero_params[:location],
                        :hireable => hero_params[:hireable] == 'true',
                        :blog => hero_params[:blog],
                        :following => hero_params[:following].to_i,
                        :followers => hero_params[:followers].to_i,
                        :public_repos => hero_params[:public_repos].to_i,
                        :public_gists => hero_params[:public_gists].to_i,
                        :bio => hero_params[:bio],
                        :name => hero_params[:name],
                        :avatar_url => hero_params[:avatar_url],
                        :html_url => hero_params[:html_url],
                        :joined_github_at => DateTime.parse(hero_params[:created_at]),
                        :gravatar_id => hero_params[:gravatar_id],
                        :following => hero_params[:following].to_i,
                      )
      @hero.save
    end
  end
end
