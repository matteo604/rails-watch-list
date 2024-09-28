Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # RESTful routes for bookmarks
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [:destroy]
  # Defines the root path route ("/")
  # Uncomment and customize if you have a root path in your app
  # root "posts#index"

  resources :movies, only: [:index]
end
