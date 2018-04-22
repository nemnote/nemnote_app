Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'notes#show'
  get '/signup', to:'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/post_list', to: 'users#show'
  get '/post', to: 'notes#new'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :notes,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
