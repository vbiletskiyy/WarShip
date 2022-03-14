Rails.application.routes.draw do
  root :to => 'games#index'
  resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
  
   resources :games do
    resources :shots
  end
  resources :boards do
    resources :ships 
  end
end
