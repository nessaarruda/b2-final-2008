Rails.application.routes.draw do
  resources :doctors, only: [:index, :show] do
    resources :patients, controller: 'appointments',only: [:destroy]
  end
  resources :hospitals, only: [:index, :show]
  resources :patients, only: [:index, :show]
  resources :appointments, only: [:destroy]
end
