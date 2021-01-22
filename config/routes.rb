Rails.application.routes.draw do
  
  root to: 'sessions#home'
  get '/signup' => 'farriers#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth' 

  post '/horses/:id/edit' => 'horses#edit'
  delete '/horses/:id' => 'horses#destroy'

  post '/barns/:id/edit' => 'barns#edit'
  post '/owners/:id/edit' => 'owners#edit'
  post '/appointments/:id/edit' => 'appointments#edit'

  get '/horses/client_flagged' => 'horses#client_flagged'
  get '/search' => 'owners#index'

  resources :farriers do
    resources :horses, only: [:index, :new, :create]
    resources :appointments, only: [:index, :new, :create]
  end

  resources :horses do
    resources :appointments, only: [:index, :new, :create]
  end

  resources :appointments
  resources :barns
  resources :owners
end
