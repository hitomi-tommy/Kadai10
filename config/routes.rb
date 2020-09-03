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
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
