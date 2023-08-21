Rails.application.routes.draw do
  root to: 'records#index'
  devise_for :users
  resources :records, only: [:index,:show]

end
