Rails.application.routes.draw do
  root to: 'sessions#home'
  get '/signup' => 'farriers#new'

  get '/login' => 'sessions#new'

  # I don't think I need this one:?
  # post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :appointments
  resources :horses
  resources :farriers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
