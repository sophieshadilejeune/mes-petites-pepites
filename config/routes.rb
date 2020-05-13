Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: {
        :registrations => "users/registrations"
      }
  # resources :users, only: [:show]
  get 'users/:user_id/cities/:id', to: 'users#show'
  # get 'try', to: 'pages#try'
  get 'dashboard/cities/:id', to: 'pages#dashboard', as: 'dashboard'
  get '/cities/select', to: 'locations#new'
  post '/cities/select', to: 'locations#create'
  resources :locations, only: [:new, :create]
  resources :cities, only: [:index, :new, :create, :show] do
  resources :places do
    resources :reviews, only: [:new, :create]
  end
end

  get 'categories/manage', to: 'categories#manage', as: 'manage_categories'
  resources :categories, except: [:show]
end
