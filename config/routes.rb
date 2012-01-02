Githeroes::Application.routes.draw do
  devise_for :heroes, :controllers => { :omniauth_callbacks => "heroes/omniauth_callbacks" } do
    get '/heroes/auth/:provider' => 'heroes/omniauth_callbacks#passthru'
  end

  resources :heroes, :only => [:create, :show] do
    member do
      post :vote
    end
  end

  match '/h/:id', :to => 'heroes#show', :as => :short_hero

  root :to => 'home#index'
end
