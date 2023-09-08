Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"

  resources :plans
  resources :users
  resources :records
  resources :spots

end
