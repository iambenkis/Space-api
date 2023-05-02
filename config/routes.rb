Rails.application.routes.draw do
  # resources :reserveds
  post '/auth/login', to: 'api/v1/users#login' 
  post '/auth/signup', to: 'users#create'
  get  '/users', to: 'users#index'
  get 'users/:username', to: 'users#show'
  # get '/*a', to: 'application#not_found'

  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :missions
      resources :rockets 
      resources :reserveds
      resources :users, except: [:create]
    end
  end
end
