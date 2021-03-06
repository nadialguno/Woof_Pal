Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/kitchen_sink", to: 'pages#kitchen_sink'

  resources :dogs, only: [:new, :create, :show]
  resources :services, only: :index

  resources :appointments, only: [] do
    resource :reschedule, only: [:new, :create]
  end

  resources :dogs, only: [] do
    resource :schedule, only: [:show] do
      get "download"
      get "webcal"
    end
  end
end
