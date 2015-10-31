Rails.application.routes.draw do

  devise_for :users
  resources :garages do
    resources :booths do
      resources :items
    end
  end

  resources :categories

  get '/items/search', to: "items#search", as: :items_search
  root "garages#index"
end