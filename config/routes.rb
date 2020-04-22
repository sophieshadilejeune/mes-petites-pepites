Rails.application.routes.draw do
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  # get 'categories', to: 'categories#index'
  # get 'categories/new'
  # get 'categories/:id', to: 'category#show'
  # get 'categories/edit'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'places/new', to: 'places#new'
  post 'places', to: 'places#create'
  get 'places/:id', to: 'places#show', as: :place
  get 'places/:id/edit', to: 'places#edit', as: :edit_place
  put 'places/:id', to: 'places#update'
  delete 'places/:id', to: 'places#destroy', as: :delete_place

  resources :categories, except: [:index] do
  end

  # resources :places
end
