Rails.application.routes.draw do
  root "users#new"
  resources :posts do
    collection do
      post :confirm
      # patch :update
    end
  end
  get 'sessions/new'
  resources :users
  get 'users/:id/favorites', to: 'users#favorites'
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  config.action_mailer.default_url_options = { host: 'vast-ridge-19391.herokuapp.com'}
  config.action_mailer.delivery_method = :letter_opener_web
end
