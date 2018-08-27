Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "/login", to: "sessions#create"
      get "/logout", to: "sessions#destroy"

      namespace :admin do
        resources :employees, only: [:create]
      end
    end
  end
end
