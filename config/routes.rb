Rails.application.routes.draw do
  post '/auth/login', to: 'api/v1/users#login' 
  post '/auth/signup/', to: 'users#create'
  # get '/*a', to: 'application#not_found'
  # resources :rockets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :missions
      resources :rockets
      resources :users, except: [:create]
    end
  end
end
