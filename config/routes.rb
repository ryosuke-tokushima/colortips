Rails.application.routes.draw do

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
  end

  root to: 'posts#index'

  
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users
  resource :profile,only: %i[show edit update]

  resources :color_palettes do
    post 'analyze', on: :collection
  end

  resources :posts, shallow: true do
    resources :categories
  end

  resources :color_palettes do
    delete :delete, on: :member
  end

  resources :posts do
    collection do
      get :search, to: 'posts#search'
    end
  end

  resources :users do
    resources :posts
  end
 
  namespace :admin do
    resources :users
  end

  namespace :admin do
    resources :posts
  end

  namespace :admin do
    resources :colors
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
