Rails.application.routes.draw do
  resources :users, only: [:new]
  resources :posts do
    collection do
      post :confirm
    end
  end
end
