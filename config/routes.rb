PlayAuth::Engine.routes.draw do
  root 'users#guide'
  get '/reg' => 'users#new', as: :reg
  resources :users do
    collection do
      get 'developers'
      post 'log_in_user'
      get 'guide'
    end
  end
  #resources :sessions
  get    '/login'   => 'sessions#new', as: :login
  post   '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy', as: :logout
end
