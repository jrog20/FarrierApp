Rails.application.routes.draw do
  
  root to: 'sessions#home'
  get '/signup' => 'farriers#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth' 

  post 'horses/:id/edit' => 'horses#edit'
  delete 'horses/:id/destroy' => 'horses#destroy'

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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
