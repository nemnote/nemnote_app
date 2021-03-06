Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'notes#show'
  get '/signup', to:'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/post_list', to: 'users#show'
  get '/post', to: 'notes#new'
  get '/note', to: 'notes#post_notes'
  get '/note_buy', to: 'notes#buy_note'
  patch '/note_buy', to: 'notes#buy_note_create'
  get  '/images', to: 'images#new'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :notes,          only: [:create, :destroy,:buy_note]
  resources :relationships,       only: [:create, :destroy]
  resources :images, only:[:create]
end
