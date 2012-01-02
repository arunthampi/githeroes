module HeroesHelper
  def twitter_text_for(hero)
    if hero.present?
      "I just voted for @#{hero.login} on @githeroes, you should too!"
    else
      "I'm using @githeroes to nominate my personal GitHub hero!"
    end
  end
end
