Rails.application.routes.draw do
  devise_for :users  
  resources :users do
    member do
      get :following, :followers
    end  
    resources :posts
  end
  resources :friendships, only: %i[create destroy]
  get 'users' => 'users#index', as: 'user_root'
  root 'home#index'
end
