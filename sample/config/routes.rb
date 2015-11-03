Rails.application.routes.draw do
  root 'home#index'
  mount PlayAuth::Engine => '/auth', :as => :auth
end
