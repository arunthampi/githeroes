Githeroes::Application.routes.draw do
  devise_for :heroes, :controllers => { :omniauth_callbacks => "heroes/omniauth_callbacks" } do
    get '/heroes/auth/:provider' => 'heroes/omniauth_callbacks#passthru'
  end

  resources :heroes, :only => [:create, :show] do
    member do
      post :vote
    end
  end

  match '/leaderboard', :to => 'home#leaderboard', :as => 'leaderboard'
  match '/:id', :to => 'heroes#show', :as => :short_hero
  match '/:id/badge_preview', :to => 'heroes#badge', :as => :badge_hero
  match '/h/:id' => redirect("/%{id}")

  root :to => 'home#index'
end
