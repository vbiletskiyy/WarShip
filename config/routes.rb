Rails.application.routes.draw do
  root :to => 'games#index'
  resources :games
  resources :boards do
    resources :ships 
  end
end
