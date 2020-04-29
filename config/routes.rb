Rails.application.routes.draw do
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'categories/manage', to: 'categories#manage'
  devise_for :users
  resources :users, only: [:show]

  resources :places do
    resources :reviews
  end
  resources :categories, except: [:index]
end
