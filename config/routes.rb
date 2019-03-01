Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :school_categories
      resources :categories
      resources :reviews
      resources :colleges
      resources :users
      resources :favorites

      post "/login", to: "auth#login"
      get "/current_user", to: "auth#get_user_from_token"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
