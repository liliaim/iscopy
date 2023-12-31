Rails.application.routes.draw do
  devise_for :users
  # root to: "plans#index"
  root to: "users#index"
  get '/prefectures/:id', to: 'prefectures#show', as: 'prefecture'

  resources :plans
  # resources :users
  resources :users do
    collection do
      get 'paginate'
    end
  end
  resources :records
  resources :spots

end
