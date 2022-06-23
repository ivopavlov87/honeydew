Rails.application.routes.draw do
  post "/api/v1/login", to: "api/v1/sessions#create"
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users
      resource :session
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
