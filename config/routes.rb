Rails.application.routes.draw do
  root to: 'sessions#home'
  get '/signup' => 'farriers#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  resources :appointments
  resources :horses
  resources :farriers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
