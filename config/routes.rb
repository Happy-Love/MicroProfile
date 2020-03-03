Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'users' => 'users#index', as: 'user_root'
  root 'home#index'
end
