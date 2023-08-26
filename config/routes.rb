Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"

  resources :plans
  resources :users, only: :show
  resources :records, only: [:index,:show]

end
