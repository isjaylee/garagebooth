Rails.application.routes.draw do

  devise_for :users
  resources :booths do
    resources :items
  end

  resources :categories

  get '/dashboard', to: "users#dashboard", as: :dashboard
  get '/items/search', to: "items#search", as: :items_search
  root "garages#index"
end