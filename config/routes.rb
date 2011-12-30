Githeroes::Application.routes.draw do
  resources :heroes, :only => [:create, :show]

  match '/h/:id', :to => 'heroes#show', :as => :short_hero

  root :to => 'home#index'
end
