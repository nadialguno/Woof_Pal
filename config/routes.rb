Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/kitchen_sink", to: 'pages#kitchen_sink'

  resources :dogs, only: [ :new, :create, :show]


  resources :dogs, only: [] do
    resource :schedule, only: [:show]
  end

end
