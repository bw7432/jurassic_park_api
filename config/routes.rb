Rails.application.routes.draw do
  get '/' => 'dinosaurs#index'
  resources :dinosaurs
  resources :cages
  resources :species
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :dinosaurs
      resources :cages
      resources :species
    end
  end
end
