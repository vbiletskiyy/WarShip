Rails.application.routes.draw do
  root :to => 'games#index'
  resources :games do
    resources :shots
  end
  resources :boards do
    resources :ships 
  end
end
