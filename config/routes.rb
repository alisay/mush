Rails.application.routes.draw do
  resources :mushrooms
  resources :sellers
  resources :profiles
  devise_for :users
  root 'home#page'
  get '/search' => 'pages#search', :as => 'search_page'
  get "/payments/success", to: "payments#success"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
