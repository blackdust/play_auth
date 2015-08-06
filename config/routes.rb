PlayAuth::Engine.routes.draw do
  root 'users#new'
  get '/reg' => 'users#new', as: :reg
  resources :users
  #resources :sessions
  get    '/login'   => 'sessions#new', as: :login
  post   '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy', as: :logout
end

