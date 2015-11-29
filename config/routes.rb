Rails.application.routes.draw do

  devise_for :users
  resources :booths do
    resources :items
  end

  resources :categories

  get '/nearby_booths', to: "booths#nearby_booths", as: :nearby_booths
  get '/dashboard', to: "users#dashboard", as: :dashboard
  get '/items/search', to: "items#search", as: :items_search
  post 'contact', to: 'messages#create'
  root "booths#index"
end