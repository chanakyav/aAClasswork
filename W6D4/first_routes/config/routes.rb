Rails.application.routes.draw do


  resources :users, only: [:index, :update, :show, :destroy, :create] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  resources :artworks, only: [:update, :show, :destroy, :create] do 
    resources :comments, only: [:index]
  end
  resources :artwork_shares, only: [:destroy, :create]

  resources :comments, only: [:create, :destroy]

end
