Rails.application.routes.draw do
  resources :rockets
  resources :missions
  # resources :rockets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :missions
      resources :rockets
    end
  end
end
