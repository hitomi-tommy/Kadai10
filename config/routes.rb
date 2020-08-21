Rails.application.routes.draw do
  resources :users
  resources :posts do
    collection do
      post :confirm
    end
  end
end
