Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'home', to: 'pages#home', as: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update] do
    member do
      get :follow
      get :unfollow
      get :favs
    end
    resources :tweets, only: [:index, :create]
  end

  resources :tweets, only: [] do
    member do
      get :like
    end
  end

  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:index, :create]
  end

end
