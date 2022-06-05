Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/kitchen_sink", to: 'pages#kitchen_sink'

  resources :dogs, only: [ :new, :create, :show]
  resources :services, only: :index

  resources :dogs, only: [] do
    resource :schedule, only: [:show] do
      get "download"
    end
  end

end
