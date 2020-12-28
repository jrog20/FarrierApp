Rails.application.routes.draw do
  root to: 'static#home'
  resources :appointments
  resources :horses
  resources :farriers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
