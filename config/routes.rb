Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :dogs, only: [] do
    resource :schedule, only: [:show]
  end
end
