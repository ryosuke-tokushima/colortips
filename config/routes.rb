Rails.application.routes.draw do

  root to: 'posts#index'
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users
  resources :posts
  resource :profile,only: %i[show edit update]
  resources :color_palettes do
    post 'analyze', on: :collection
  end
  resources :posts, only: %i[index new create]
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
