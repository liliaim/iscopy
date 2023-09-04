Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"

  resources :plans
  resources :users, only: :show
  resources :records, only: [:new,:create]
  resources :spots

  # get '/google_calendar/callback', to: 'users#callback'
end
