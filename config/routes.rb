Rails.application.routes.draw do
  devise_for :users  
  resources :users, :posts
  get 'users' => 'users#index', as: 'user_root'
  root 'home#index'
end
